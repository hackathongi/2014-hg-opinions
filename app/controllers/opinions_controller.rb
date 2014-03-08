require 'net/https'
require 'json'
require 'faraday'

class OpinionsController < ApplicationController


  def index
    conn = Faraday.new
    response = conn.get 'https://api.github.com/repos/technoweenie/faraday'
    response.status
    # binding.pry
    @api_response = response.body
  end

  def test
        url = URI.parse('https://api.github.com/repos/technoweenie/faraday')

        response = Net::HTTP.start(url.host, use_ssl: true) do |http|
          http.get url.request_uri, 'User-Agent' => 'MyLib v1.2'
        end

        @foo =  response

        case response
            when Net::HTTPRedirection
              # repeat the request using response['Location']
            when Net::HTTPSuccess
              repo_info = JSON.parse response.body
        end

        json = JSON.parse(response.body)

        @parsed_json = json

    end

end
