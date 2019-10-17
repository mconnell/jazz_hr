require "net/http"
require "json"

module JazzHR
  class Client
    BASE_URI = "https://api.resumatorapi.com/v1".freeze

    def initialize(api_key:)
      @api_key = api_key
    end

    def get(path:)
      json_string = Net::HTTP.get(uri_for(path: path))
      response    = JSON.parse(json_string)

      raise Error.new(response["error"]) if response.is_a?(Hash) && response["error"]

      response
    end

    private

    def uri_for(path:)
      URI("#{BASE_URI}#{path}?apikey=#{@api_key}")
    end
  end
end
