package_names = case node['platform']
when 'ubuntu', 'debian'
  execute "apt-get update" do
    ignore_failure true
    not_if do ::File.exists?('/var/lib/apt/periodic/update-success-stamp') end
  end
  %w[autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev
    zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev]
when 'centos', 'fedora'
  %w[gcc openssl-devel libyaml-devel libffi-devel readline-devel zlib-devel
    gdbm-devel ncurses-devel]
when 'opensuse'
  %w[gcc automake gdbm-devel libffi-devel libyaml-devel openssl-devel
    ncurses-devel readline-devel zlib-devel]
end

package_names.each do |pkg_name|
  package pkg_name
end

bash 'build_ruby' do
  user 'root'
  cwd '/tmp'
  code <<-EOS
  wget -O - http://cache.ruby-lang.org/pub/ruby/ruby-#{node['ruby']['version']}.tar.bz2 | tar -xj
  cd ruby-#{node['ruby']['version']}
  ./configure
  make
  make install
  rm -rf ruby-#{node['ruby']['version']}
  EOS
  not_if '[[ $(ruby -v) == *#{node["ruby"]["version"]}* ]]'
end

node['ruby']['gems'].each do |gem_name|
  gem_package gem_name
end