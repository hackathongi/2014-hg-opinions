require 'net/https'
require 'json'
require 'faraday'

class OpinionsController < ApplicationController

  before_filter :load_data

  def index

    if params[:ecommerce_id]
      @ecommerce_id = params[:ecommerce_id]
      @default_limit = OPINIONS_CONFIG['opinions_limit']
      @base_url = OPINIONS_CONFIG['domain']
      @api_end_point = OPINIONS_CONFIG['opinions_end_point']

      @api_url = "#{@base_url}/#{@api_end_point}"

      @total_pages =  23
      @query_parameters = request.query_parameters.slice(:page, :size)

      if @total_pages > 0
        @current_page = params[:page].to_i > 0 ? params[:page].to_i : 1
        @last_page = @current_page + 5 <= 10 ? 10 : @current_page + 5
        if @last_page > @total_pages
          @last_page = @total_pages
        end
        @first_page = @current_page - 5 > 0 && @current_page - 5 < @last_page  ? @current_page - 5 : 1
        @prev_page = @first_page -1 > 0 ? @first_page -1 : false
        @next_page = @last_page + 1 <= @total_pages ? @last_page + 1 : false
      end

      @api_url = "#{@api_url}?offset=#{@current_page}&token=#{@ecommerce_id}&limit=#{@default_limit}"


      if params[:api]
        begin
          @fake_opinions = @opinions
          conn = Faraday.new @api_url
          response = conn.get
          response.status
          if status == 200
            @opinions = JSON.parse response.body
          else
            @opinions = @fake_opinions
            flash[:error] = "Ha ocurrido un error al conectar con el servidor"
          end
        rescue
          @opinions = @fake_opinions
          flash[:error] = "Ha ocurrido un error al conectar con el servidor"
        end
      end

    else
      flash[:error] = "Aqui no hay opiniones"
    end
  end

  def fake_api
    render json: @opinions
  end

  private

  def load_data
    @opinions = [{
          'id' => 2,
          'description' => "Despista un poco el rastreo del paquete. No es muy detallado. Por lo demás, el ordenador y características de mi Medion Akoya excelente, salvo en la batería que no dura apenas en comparación, quizás, a otras marcas.",
          'rating' => 5,
          'lang' => "es",
          'createdAt' => '2013-03-13 12:12',
          'username' => "Richard"
        },
        {
          'id' => 1,
          'description' => "La comparativa es muy clara y accesible y permite decidir con una amplia información. Resulta muy útil.",
          'rating' => 0,
          'lang' => "es",
          'createdAt' => '2013-03-14 12:12',
          'username' => "Smith"
        },
        {
          'id' => 4,
          'description' => "Los productos están bien presentados y bien especificados.",
          'rating' => 5,
          'lang' => "es",
          'createdAt' => '2013-03-15 12:12',
          'username' => "Paco"
        },
        {
          'id' => 4,
          'description' => "Estoy totalmente de acuerdo con todo, es una pena que la tienda online Medion en España haya cerrado, parecia muy interesante y solo pude efectuar dos compras.",
          'rating' => 2,
          'lang' => "es",
          'createdAt' => '2013-03-13 12:12',
          'username' => "Williams"
        }]
  end

  def test
  end
end
