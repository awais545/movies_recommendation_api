source 'https://rubygems.org'

gem 'rails', '3.2.13'

gem 'mysql2'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', platforms: :ruby
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# ruby wrapper for elasticsearch
gem 'tire'

group :test, :development do
  gem 'rspec-rails', '~>2.0'
  gem 'shoulda-matchers'
  gem 'pry-rails'
end

group :test do
  gem 'factory_girl_rails', '~>4.2'
end

gem 'sidekiq'
gem 'sinatra', require: false
gem 'imdb'