module Wombat

  class << self
    attr_accessor :configuration

   def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :connection_id, :connection_token
  end

end
