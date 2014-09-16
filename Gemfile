# encoding: utf-8

source 'https://rubygems.org'

gem 'berkshelf',  '~> 3.0'
gem 'chef',       '~> 11.12'

group :test do
  gem 'rake'
  gem 'chefspec', '~> 4.0'
  gem 'foodcritic', '~> 3.0'
  gem 'thor-foodcritic'
  gem 'rubocop',    '~> 0.23'
end

group :development do
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-kitchen'
  gem 'guard-rubocop'
  gem 'guard-foodcritic'
end

group :integration do
  gem 'test-kitchen', '~> 1.0'
  gem 'kitchen-vagrant'
  gem 'kitchen-sharedtests', '~> 0.2.0'
end

group :openstack do
  gem 'kitchen-openstack'
end
