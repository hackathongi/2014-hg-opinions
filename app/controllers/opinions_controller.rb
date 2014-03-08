require 'net/https'
require 'json'
require 'faraday'

class OpinionsController < ApplicationController

  before_filter :load_data

  def index

    if params[:ecommerce_id]
      @ecommerce_id = params[:ecommerce_id]
      # conn = Faraday.new
      # response = conn.get 'http://localhost:3000/fake-api'
      # response.status
      # @opinions = response.body
    end
    # binding.pry
  end

  def fake_api
    render json: @opinions
  end

  private

  def get_ecommerce_id
    @ecommerce_id = params[:ecommerce_id] ? params[:ecommerce_id] : 1
  end

  def load_data
    @opinions = [
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
  end
end
