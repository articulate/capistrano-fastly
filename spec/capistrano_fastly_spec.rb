require 'spec_helper'

describe Capistrano::Fastly do
    before do
        @configuration = Capistrano::Configuration.new
        Capistrano::Fastly.load_into(@configuration)
    end

    it 'provides fastly:purge_all' do
        @configuration.find_task('fastly:purge_all').should_not == nil
    end

end
