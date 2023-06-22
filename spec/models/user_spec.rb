require 'rails_helper'

RSpec.describe 'Users', type: :model do
  describe "GET /index" do
  it 'gets a list of users' do
  User.create(
    email: 'rashaan@learn.com', 
    password: 'password', 
  )
  get '/users'
  user = JSON.parse(response.body)

  expect(response).to have_http_status(200)
  expect(user.length).to eq 4
    end
  end
end