require 'spec_helper'

describe Capistrano::Fastly do
    before do
        @capistrano = Capistrano::Configuration.new
        Capistrano::Fastly.load_into(@capistrano)
        @fastly_config = {
            :service_id => 'XXXXXXXXXXXXXXXXXXXXX',
            :api_key => 'YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY'
        }
    end

    context 'purge_all' do
        it 'is present' do
            @capistrano.find_task('fastly:purge_all').should_not == nil
        end

        it 'fails without Fastly configuration values' do
            @capistrano.set(:fastly_config, nil)
            expect { @capistrano.find_and_execute_task('fastly:purge_all') }. to raise_error(Capistrano::Error, 'Fastly configuration is not set')
        end

        it 'completes with Fastly configuration values' do
            @capistrano.set(:fastly_config, @fastly_config)
            VCR.use_cassette('fastly_purge_all') do
                expect { @capistrano.find_and_execute_task('fastly:purge_all') }. to_not raise_error
            end
        end
    end

end
