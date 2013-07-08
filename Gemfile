source "https://rubygems.org"

gem 'draper'

group :test do
  gem 'simplecov', :require => false
  gem 'simplecov-rcov', :require => false
  gem 'rspec-rails'
end

group :development do
  gem 'spring'
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

# the released friendlyid gem isn't good enough
group :development, :test do
  gem 'friendly_id', github: 'FriendlyId/friendly_id'
end
