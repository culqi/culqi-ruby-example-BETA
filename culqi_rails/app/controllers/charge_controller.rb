require 'culqi-ruby'

class ChargeController < ApplicationController

  protect_from_forgery with: :null_session

  def create
    Culqi.secret_key = 'sk_test_UTCQSGcXW8bCyU59'
    charge = Culqi::Charge.create(
      :amount => 1000,
      :antifraud_details => {
        :address => 'Avenida Lima 1232',
        :address_city => 'LIMA',
        :country_code => 'PE',
        :email => 'will@culqi.com',
        :first_name => 'Will',
        :last_name => 'Aguirre',
        :phone_number => 3333339,
      },
      :email => 'will@culqi.com',
      :capture => true,
      :currency_code => 'PEN',
      :description => 'Venta de prueba',
      :installments => params[:installments],
      :source_id => params[:token_id]
    )
    render :json => charge
  end

end
