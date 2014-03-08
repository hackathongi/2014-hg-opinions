require 'net/https'
require 'json'
require 'faraday'

class OpinionsController < ApplicationController

  before_filter :load_data

  def index

    if params[:ecommerce_id]
      @ecommerce_id = params[:ecommerce_id]
      @base_url = OPINIONS_CONFIG['domain']
      @api_end_point = OPINIONS_CONFIG['opinions_end_poin']

      @api_url = "#{@base_url}/#{@api_end_point}"

      @total_pages = 20

      if Rails.env == 'production'
        begin
          conn = Faraday.new @api_url
          response = conn.get
          response.status
          @opinions = response.body
        rescue
          # binding.pry
          flash[:error] = "Ha ocurrido un error al conectar con el servidor"
        end
      end

    end
  end

  def fake_api
    render json: @opinions
  end

  private

  def load_data
    @opinions = {
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
