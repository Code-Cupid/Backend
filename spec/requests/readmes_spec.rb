require 'rails_helper'

RSpec.describe "Readmes", type: :request do

  describe "GET /index" do
    it 'displays a list of all users'
      readme = user.readme.create(
        name:'Ernesto',
        age: 31,
        gender: 'Male',
        gender_preference: 'Female',
        location: 'California',
        programming_language: 'Ruby',
        image:'www.helloworld.com'
      )
      get '/readmes'

      readme = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(readme.first['name']).to eq('Ernesto')
 
  end
end
