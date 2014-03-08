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

  def load_data
    @api_response = {
      :opinions => [
        {
          :opinion_id => 1,
          :description => "This is a Description 1",
          :rating => 3,
          :date => '2013-03-13 12:12:12',
          :date_add => '2013-03-13 12:12:12',
          :date_update => '2013-03-13 12:12:12',
          :lang => "es",
          :customer => {
            :name => "John",
            :surname => "Smith"
          }
        },
        {
          :opinion_id => 2,
          :description => "This is a Description 2",
          :rating => 5,
          :date => '2013-03-13 10:12:12',
          :date_add => '2013-03-13 10:12:12',
          :date_update => '2013-03-13 10:12:12',
          :lang => "es",
          :customer => {
            :name => "Anna",
            :surname => "Low"
          }
        },
        {
          :opinion_id => 3,
          :description => "This is a Description 3",
          :rating => 3,
          :date => '2013-03-13 09:12:12',
          :date_add => '2013-03-13 09:12:12',
          :date_update =>'2013-03-13 09:12:12',
          :lang => "es",
          :customer => {
            :name => "Jack",
            :surname => "Jones"
          }
        },
        {
          :opinion_id => 4,
          :description => "This is a Description 4",
          :rating => 5,
          :date => '2013-03-13 08:12:12',
          :date_add => '2013-03-13 08:12:12',
          :date_update =>'2013-03-13 08:12:12',
          :lang => "es",
          :customer => {
            :name => "Tomy",
            :surname => "Makkinen"
          }
        },
        {
          :opinion_id => 5,
          :description => "This is a Description 5",
          :rating => 1,
          :date => '2013-03-13 07:12:12',
          :date_add => '2013-03-13 07:12:12',
          :date_update =>'2013-03-13 07:12:12',
          :lang => "es",
          :customer => {
            :name => "Richard",
            :surname => "Burns"
          }
        }
      ]
    }
  end
end
