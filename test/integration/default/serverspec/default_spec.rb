require 'spec_helper'

describe command('ruby -v') do
  its(:stdout) { should match '2.2.0' }
end

describe command('which xdite') do
  its(:exit_status) { should eq 0 }
end