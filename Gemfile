source "https://rubygems.org"

group :test do
  gem 'simplecov', :require => false
  gem 'simplecov-rcov', :require => false
  gem 'rspec-rails'
end

group :development do
  gem 'spring', github: "cbrunsdon/spring", branch: 'cherrypicking'
  gem 'guard-bundler'
  gem 'guard-rspec'
  gem 'guard-spring', github: 'mknapik/guard-spring'

  gem 'pry', github: 'pry/pry'
  gem 'pry-plus'
end

# Declare your gem's dependencies in tlab.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'debugger'
