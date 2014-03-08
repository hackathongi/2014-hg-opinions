require 'net/https'
require 'json'
require 'faraday'

class OpinionsController < ApplicationController

  before_filter :load_data
  def index

    # conn = Faraday.new
    # response = conn.get 'http://localhost:3000/fake-api'
    # response.status
    # # binding.pry
    # @api_response = response.body
  end

  def fake_api
    render json: @api_response
  end

  private

  def load_data
    @api_response = {
      :opinions => [
        {
          :opinion_id => 1,
          :description => "Foooooo",
          :rating => 1,
          :date => '2013-03-13',
          :date_add => '2013-02-13',
          :date_update => '2013-02-13',
          :order_id => 2,
          :lang => "es"
        },
        {
          :opinion_id => 1,
          :description => "Foooooo",
          :rating => 1,
          :date => '2013-03-13',
          :date_add => '2013-02-13',
          :date_update => '2013-02-13',
          :order_id => 2,
          :lang => "es"
        }
      ]
    }
  end
end
