require './lib/database_connection.rb'
require './lib/database_connection_setup.rb'

class Payment
  def self.initiate(name, description, amount)
    Stripe.api_key = DatabaseConnection.query('select secret_key from paymentkeys order by id ASC;').values[0][0]

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: "#{name}",
        description: "#{description}",
        images: ['https://example.com/t-shirt.png'],
        amount: "#{amount * 100}",
        currency: 'gbp',
        quantity: 1,
        }],
        success_url: 'https://example.com/success',
        cancel_url: 'https://example.com/cancel',
      )
    end
  end
