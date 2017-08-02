# # encoding: utf-8

# Inspec test for recipe loadbalancer::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
describe port(80), :skip do
  it { should be_listening }
end

['openjdk-6-jdk', 'httpd'].each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe service('httpd') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/var/www/html/index.html') do
  it { should exist }
  it { should be_file }
  its('content') { should match /[Hh]ello [Ww]orld!/ }
end

describe command('curl http://localhost') do
  its('stdout') { should match /[Hh]ello [Ww]orld!/ }
end
