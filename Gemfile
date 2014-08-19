source 'https://rubygems.org'
ruby '2.0.0'

#dotenv loads environment variables
#this is the test version.
#for deploy use: gem 'dotenv-deployment'
gem 'dotenv-rails', :groups => [:development, :test]

# PostgreSQL driver
gem 'pg'

# Sinatra driver
gem 'sinatra'
gem 'sinatra-contrib'

gem 'activesupport', '~>4.1'
gem 'activerecord', '~>4.1'

gem 'rake'

gem 'shotgun'
gem 'httparty'
gem 'yummly'

group :test do
  gem 'shoulda-matchers'
  gem 'rack-test'
  gem 'rspec'
  gem 'capybara'
end

group :test, :development do
  gem 'factory_girl'
  gem 'faker'
  gem 'debugger'
end
