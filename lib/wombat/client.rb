require "wombat/client/version"

require 'openssl'
require 'httparty'
require 'active_model/array_serializer'

module Wombat
  module Client

    def self.push(json_payload, options=self.configuration)

      res = HTTParty.post(
        options[:push_url],
          {
            body: json_payload,
            headers: {
             'Content-Type'       => 'application/json',
             'X-Hub-Store'        => options[:connection_id],
             'X-Hub-Access-Token' => options[:connection_token],
             'X-Hub-Timestamp'    => Time.now.utc.to_i.to_s
            }
          }
      )
      validate(res)
      res
    end

    private

    def self.configuration
      {
        push_url: Wombat.configuration.push_url,
        connection_id: Wombat.configuration.connection_id,
        connection_token: Wombat.configuration.connection_token
      }
    end

    def self.validate(res)
      raise PushApiError, "Push not successful. Wombat returned response code #{res.code} and message: #{res.body}" if res.code != 202
    end

    class PushApiError < StandardError; end
  end
end
