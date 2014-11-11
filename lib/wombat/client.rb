require "wombat/client/version"

require 'openssl'
require 'httparty'
require 'active_model/array_serializer'

module Wombat
  module Client

    def self.push(json_payload, uri=Wombat.configuration.push_url)
      res = HTTParty.post(
        uri,
          {
            body: json_payload,
            headers: {
             'Content-Type'       => 'application/json',
             'X-Hub-Store'        => Wombat.configuration.connection_id,
             'X-Hub-Access-Token' => Wombat.configuration.connection_token,
             'X-Hub-Timestamp'    => Time.now.utc.to_i.to_s
            }
          }
      )
      validate(res)
      res
    end

    private
    def self.validate(res)
      raise PushApiError, "Push not successful. Wombat returned response code #{res.code} and message: #{res.body}" if res.code != 202
    end

    class PushApiError < StandardError; end
  end
end
