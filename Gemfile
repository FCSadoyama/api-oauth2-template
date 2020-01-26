source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'

gem 'sqlite3', '~> 1.4'
gem 'puma', '~> 4.1'
gem 'bcrypt', '~> 3.1.7'
gem 'doorkeeper', '~> 5.2.3'
gem 'doorkeeper-grants_assertion', '~> 0.2.0'

gem 'faraday', '~> 1.0.0'
gem 'oj', '~> 3.10.1'

gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-byebug'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
