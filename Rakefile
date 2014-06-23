#!/usr/bin/env rake
# encoding: utf-8

require 'foodcritic'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

# General tasks

# Rubocop before rspec so we don't lint vendored cookbooks
desc 'Run all tests except Kitchen (default task)'
task integration: %w(rubocop foodcritic spec)
task default: :integration

# Lint the cookbook
desc 'Run linters'
task lint: [:rubocop, :foodcritic]

# Lint the cookbook
desc 'Run all linters: rubocop and foodcritic'
task run_all_linters: [:rubocop, :foodcritic]

# Run the whole shebang
desc 'Run all tests'
task test: [:lint, :integration]

# RSpec
desc 'Run chefspec tests'
task :spec do
  puts 'Running Chefspec tests'
  RSpec::Core::RakeTask.new(:spec)
end

# Foodcritic
desc 'Run foodcritic lint checks'
task :foodcritic do
  if Gem::Version.new('1.9.2') <= Gem::Version.new(RUBY_VERSION.dup)
    puts 'Running Foodcritic tests...'
    FoodCritic::Rake::LintTask.new do |t|
      t.options = { fail_tags: ['any'] }
      puts 'done.'
    end
  else
    puts "WARN: foodcritic run is skipped as Ruby #{RUBY_VERSION} is < 1.9.2."
  end
end

# Rubocop
desc 'Run Rubocop lint checks'
task :rubocop do
  RuboCop::RakeTask.new
end

begin
  require 'kitchen/rake_tasks'
  Kitchen::RakeTasks.new

  desc 'Alias for kitchen:all'
  task acceptance: 'kitchen:all'

rescue LoadError
  puts '>>>>> Kitchen gem not loaded, omitting tasks' unless ENV['CI']
end
