source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.0'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.4', '>= 1.4.1'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Transpile app-like JavaScript.
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster.
gem 'turbolinks'
# Faster pagination with Pagy
gem 'pagy', '~> 3.6'
# Soft delete with Discard
gem 'discard', '~> 1.1'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'faker'
  gem 'rspec-rails', '~> 4.0.0.beta2'
  gem 'capybara', '~> 3.29'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0', '>= 2.0.1'
  gem 'pry-rails'
end
