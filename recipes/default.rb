%w[
  wget autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev
  zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
].each do |pkg_name|
  package pkg_name
end

bash 'build_ruby' do
  user 'root'
  cwd '/tmp'
  code <<-EOS
  wget -O - http://cache.ruby-lang.org/pub/ruby/ruby-#{node[:ruby][:version]}.tar.bz2 | tar -xj
  cd ruby-#{node[:ruby][:version]}
  ./configure
  make
  make install
  rm -rf ruby-#{node[:ruby][:version]}
  EOS
  not_if '[[ $(ruby -v) == *#{node[:ruby][:version]}* ]]'
end

node[:ruby][:gems].each do |gem_name|
  gem_package gem_name
end