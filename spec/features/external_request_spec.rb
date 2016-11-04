require 'spec_helper'

feature 'External request' do
  it 'queries FactoryGirl contributors on GitHub' do
    uri = URI("https://api.mailgun.net/v3/sandbox962ca6f0238746fb9838e8abcd0873fe.mailgun.org/messages")

    response = Net::HTTP.get(uri)
    p response
    expect(response).to be_an_instance_of(String)
  end
end
