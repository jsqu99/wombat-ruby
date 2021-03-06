require 'wombat/client'

module Wombat

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :connection_id, :connection_token, :push_url

    def initialize
      @push_url = 'https://push.wombat.co'
    end
  end

end
