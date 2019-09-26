require './lib/payment.rb'

describe Payment do
  it 'returns a session ' do
    expect { Payment.initiate('name', 'description', 100) }.to_not raise_error Stripe::AuthenticationError
    expect { Payment.initiate('name', 'description', 100) }.to_not raise_error Stripe::InvalidRequestError
  end
end
