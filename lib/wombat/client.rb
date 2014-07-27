require "wombat/client/version"

require 'json'
require 'openssl'
require 'httparty'
require 'active_model/array_serializer'

module Wombat
  module Client

    def self.push(json_payload)
      res = HTTParty.post(
        Spree::Wombat::Config[:push_url],
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
    end
  end
end
