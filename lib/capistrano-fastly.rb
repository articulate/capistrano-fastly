require 'capistrano'
require 'capistrano-fastly/version'

module Capistrano
  module Fastly
    def self.load_into(configuration)
      configuration.load do
        desc 'Purge all Fastly cache'
        namespace :fastly do
          task :purge_all do
            logger.info('Purged. Baaaaaaarf.')
          end
        end
      end
    end
  end
end

if Capistrano::Configuration.instance
  Capistrano::Fastly.load_into(Capistrano::Configuration.instance)
end
