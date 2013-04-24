# Capistrano::Fastly

Capistrano tasks for interacting with [Fastly](http://www.fastly.com/), a CDN/caching service.

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano-fastly'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-fastly

## Usage

The only task at the moment is `purge_all` which flushes the entire cache for a single site.

Add this to your deploy.rb file with your real service id and api key:

        require 'capistrano/fastly'

        set :fastly_config, { 
            :service_id => '----', 
            :api_key => '----' 
        }

Then you'll be able to call this task directly:

        cap fastly:purge_all

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
