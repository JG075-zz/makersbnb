require 'spec_helper'

feature 'External request' do
  it 'queries mailgun' do
    uri = URI("https://api.mailgun.net/v3/sandbox962ca6f0218746fb9838e8abcd0873fe.mailgun.org/messages")

    response = Net::HTTP.get(uri)

    expect(response).to be_an_instance_of(String)
  end
end
