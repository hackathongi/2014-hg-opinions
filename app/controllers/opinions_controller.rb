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

      @total_pages =  @opinions[:total_page]
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
      else
        @total_pages = 0
      end

      @opinions_array = @opinions[:opinions]

      if false
        begin
          conn = Faraday.new @api_url
          response = conn.get
          response.status
          @opinions = response.body
        rescue
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
        :total_page => 14,
        :total_opinions => 5,
        :average_rating => 4,
        :opinions => [
        {
          :opinion_id => 1,
          :description => "La comparativa es muy clara y accesible y permite decidir con una amplia información. Resulta muy útil.",
          :rating => 3,
          :lang => "es",
          :date => '2013-03-13 13:12',
          :client => {
            :name => "John",
            :surname => "Smith"
          }
        },
        {
          :opinion_id => 2,
          :description => "Despista un poco el rastreo del paquete. No es muy detallado. Por lo demás, el ordenador y características de mi Medion Akoya excelente, salvo en la batería que no dura apenas en comparación, quizás, a otras marcas.",
          :rating => 5,
          :lang => "es",
          :date => '2013-03-13 12:12',
          :client => {
            :name => "Richard",
            :surname => "Burns"
          }
        },
        {
          :opinion_id => 3,
          :description => "Los productos están bien presentados y bien especificados.",
          :rating => 2,
          :lang => "es",
          :date => '2013-03-13 11:12',
          :client => {
            :name => "Helena",
            :surname => "Williams"
          }
        },
        {
          :opinion_id => 4,
          :description => "Estoy totalmente de acuerdo con todo, es una pena que la tienda online Medion en España haya cerrado, parecia muy interesante y solo pude efectuar dos compras.",
          :rating => 5,
          :lang => "es",
          :date => '2013-03-13 10:12',
          :client => {
            :name => "Colin",
            :surname => "McRae"
          }
        },
        {
          :opinion_id => 5,
          :description => "El producto bastante arañado y con muchos signos de desgaste , me ha decepcionado bastante.",
          :rating => 1,
          :lang => "es",
          :date => '2013-03-13 09:12',
          :client => {
            :name => "Elthon",
            :surname => "John"
          }
        },
        {
          :opinion_id => 6,
          :description => "El embalaje daba pena, cartón deque parecía papel de fumar. ASí pasó cuando lo enchufé pitaba la placa base. En poco mas de un mes de vida del PC ya lo he llevado a reparar 2 veces. El servico técnico me lo envió sin reparar completamente. DEspués de comprar en promoción por la web quitaron la venta. Da la sensación que queráin quitarse stock defectuoso de encima. Estoy muy descontento y sin ordenador todavía.",
          :rating => 3,
          :lang => "es",
          :date => '2013-03-13 08:12',
          :client => {
            :name => "Tommy",
            :surname => "Makkinen"
          }
        }
      ]
    }
  end

  def test
  end
end
