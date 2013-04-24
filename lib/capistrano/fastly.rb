require 'capistrano'
require 'capistrano/fastly/version'
require 'net/https'

module Capistrano
  module Fastly
    def self.load_into(configuration)
      configuration.load do

        namespace :fastly do
          desc 'Purge entire Fastly cache'
          task :purge_all do
            raise(Capistrano::Error, 'Fastly configuration is not set') unless fetch(:fastly_config).kind_of?(Hash)

            uri = URI.parse("https://api.fastly.com")
            http = Net::HTTP.new(uri.host, uri.port)
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE
            request = Net::HTTP::Post.new("/service/#{fastly_config[:service_id]}/purge_all")
            request.add_field('Content-Type', 'application/json')
            request.add_field('X-Fastly-Key', fastly_config[:api_key])
            request.body = ""
            response = http.request(request)

            if response.kind_of? Net::HTTPSuccess
              logger.info('Fastly cache purge all complete.')
            else
              logger.info("Fastly cache purge failed: #{response.body}")
            end
          end
        end
      end
    end
  end
end

if Capistrano::Configuration.instance
  Capistrano::Fastly.load_into(Capistrano::Configuration.instance)
end
