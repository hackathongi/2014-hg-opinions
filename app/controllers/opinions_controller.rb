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
    @foo = "ddddddd"
  end
end
