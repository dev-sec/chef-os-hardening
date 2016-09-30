# encoding: utf-8

source 'https://rubygems.org'

gem 'berkshelf',  '~> 4.0'
gem 'chef',       '>= 12.0'
gem 'inspec', '~> 0.9'

# pin dependency for Ruby 1.9.3 since bundler is not
# detecting that net-ssh 3 does not work with 1.9.3
if Gem::Version.new(RUBY_VERSION) <= Gem::Version.new('1.9.3')
  gem 'net-ssh', '~> 2.9'
end

group :test do
  gem 'rake'
  gem 'chefspec',   '~> 4.2.0'
  gem 'foodcritic', '~> 6.3'
  gem 'rubocop',    '~> 0.43.0'
  gem 'coveralls',  require: false
  gem 'bundler', '~> 1.5'
  gem 'minitest', '~> 5.5'
  gem 'simplecov', '~> 0.10'
end

group :development do
  gem 'guard'
  gem 'guard-rspec'
  # gem 'guard-kitchen' # guard-kitchen is not compatable with Guard 2.x
  gem 'guard-rubocop'
  gem 'guard-foodcritic'
end

group :integration do
  gem 'test-kitchen', '~> 1.0'
  gem 'kitchen-vagrant'
  gem 'kitchen-dokken'
  gem 'kitchen-inspec', '~> 0.9'
  gem 'concurrent-ruby', '~> 0.9'
end

group :tools do
  gem 'github_changelog_generator', '~> 1'
end
