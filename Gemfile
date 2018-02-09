source 'https://rubygems.org'
ruby "2.5.0"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'

gem 'pg', "~> 0.18"

gem 'haml', '~> 5.0.4'
gem 'jquery-rails', "~> 4.3.1"
gem 'sass-rails',   '~> 5.0.7'
gem 'uglifier', '>= 1.0.3'
gem 'semantic-ui-sass'

gem "devise", "~> 4.4.1"
gem "cancancan", "~> 2.1.3"
gem "simple_form", "~> 3.5.0"

gem 'omniauth-google-oauth2'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  gem 'rspec-rails', '~> 3.6'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers', '~> 2.8.0', require: false
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'

  gem 'faker'

  gem 'mailcatcher'
end

group :production do
  gem 'puma'
end
