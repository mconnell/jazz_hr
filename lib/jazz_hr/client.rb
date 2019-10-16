require "net/http"
require "json"

module JazzHR
  class Client
    BASE_URI = "https://api.resumatorapi.com/v1".freeze

    def initialize(api_key:)
      @api_key = api_key
    end

    def get(path:)
      response = Net::HTTP.get(uri_for(path: path))
      JSON.parse(response)
    end

    private

    def uri_for(path:)
      URI("#{BASE_URI}#{path}?apikey=#{@api_key}")
    end
  end
end
