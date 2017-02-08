require 'culqi-ruby'

class ChargeController < ApplicationController
  def create
    Culqi.api_key = 'sk_test_UTCQSGcXW8bCyU59'
    charge = Culqi::Charge.create(
      :amount => 1000,
      :antifraud_details => {
        :address => "Avenida Lima 1232",
        :address_city => "LIMA",
        :country_code => "PE",
        :email => "will@culqi.com",
        :first_name => "Will",
        :last_name => "Aguirre",
        :phone_number => 3333339,
      }
      :capture => true,
      :currency_code => "PEN",
      :description => "Venta de prueba",
      :installments => 0,
      :metadata => "",
      :source_id => params[:token_id]
    )
    render :json => charge
  end
end
