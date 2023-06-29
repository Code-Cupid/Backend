<!-- require 'rails_helper'

RSpec.describe "Readmes", type: :request do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
  }
  describe "GET /index" do
    it 'displays a list of all the users' do
      readme = user.readmes.create(
        name: 'Ernesto',
        age: '31',
        gender: 'male',
        gender_preference: 'female',
        location: 'CA',
        programming_language: 'ruby',
        image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
      )
      get '/readmes'

      readme = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(readme.first['name']).to eq('Ernesto')
    end
  end

  # test for creating a new apartment will live here
end -->

RSpec.describe Readme, type: :model do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
  }

  it 'should validate name' do
    readme = user.readmes.create(
      age: '31',
      gender: 'male',
      gender_preference: 'female',
      location: 'CA',
      programming_language: 'ruby',
      image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
    )
    expect(readme.errors[:name]).to include("can't be blank")
  end
end


describe "POST /create" do

    # creates as expected
    it "creates a readme with all its attributes" do
      readme_params = {
        readme: {
          name: 'Ernesto',
          age: '31',
          gender: 'male',
          gender_preference: 'female',
          location: 'CA',
          programming_language: 'ruby',
          image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
          user_id: user.id
        }
      }

      post '/readmes', params: readme_params

      readmes = Readme.all
      readme = JSON.parse(response.body)

      expect(response).to have_http_status(200)

      expect(readmes.length).to be(1)
    end
    # error if missing an attribute
    it "doesn't create a readme without a name" do
      
      readme_params = {
        readme: {
          name: nil,
          age: '31',
          gender: 'male',
          gender_preference: 'female',
          location: 'CA',
          programming_language: 'ruby',
          image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg',
          user_id: user.id
        }
      }

      post '/readmes', params: readme_params

      readme = JSON.parse(response.body)

      expect(response).to have_http_status(422)

      expect(readme['name']).to include("can't be blank")
    end
  end








UPDATE:



describe "PATCH /update" do
  it "updates a readme with valid attributes" do
      # save an apartment 
      readme = user.readmes.create(
        name: 'Ernesto',
        age: '31',
        gender: 'male',
        gender_preference: 'female',
        location: 'CA',
        programming_language: 'ruby',
        image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
      )

      get '/readmes'

      rdm = Readme.first
      # modify the existing apartment
      rdm_params = {
        readme: {
          name: 'Tucker',
          age: '31',
          gender: 'male',
          gender_preference: 'female',
          location: 'CA',
          programming_language: 'ruby',
          image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg',
          user_id: user.id
        }
      }

      # make a request to the application to update the attributes
      patch "/readmes/#{rdm.id}", params: rdm_params

      readme = JSON.parse(response.body)

      # assert that the response is correct

      expect(response).to have_http_status(200)

      expect(readme['name']).to eq('Tucker')
    end

    # missing attributes
    it "doesn't update a readme without a street" do
      # save an apartment 
      readme = user.readmes.create(
        name: 'Ernesto',
        age: '31',
        gender: 'male',
        gender_preference: 'female',
        location: 'CA',
        programming_language: 'ruby',
        image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
      )

      get '/readmes'

      rdm = Readme.first
      # modify the existing apartment
      rdm_params = {
        readme: {
          name: 'nil',
          age: '31',
          gender: 'male',
          gender_preference: 'female',
          location: 'CA',
          programming_language: 'ruby',
          image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg',
          user_id: user.id
        }
      }

      # make a request to the application to update the attributes
      patch "/readmes/#{rdm.id}", params: rdm_params

      apartment = JSON.parse(response.body)

      # assert that the response is correct
        # status code
      expect(response).to have_http_status(422)
        # error message
      expect(readme['name']).to include("can't be blank")
    end
end

DELETE:

describe "DELETE /destroy" do
    it "deletes a readme with a valid id params" do
      # save an apartment 
      readme1 = user.readmes.create(
        name: 'Ernesto',
        age: '31',
        gender: 'male',
        gender_preference: 'female',
        location: 'CA',
        programming_language: 'ruby',
        image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
        user_id: user.id
      )

      readme2 = user.readmes.create(
        name: 'Rashaan',
        age: '31',
        gender: 'male',
        gender_preference: 'female',
        location: 'Jersey',
        programming_language: 'Python',
        image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
        user_id: user.id
      )
      get '/readmes'

      expect(Readme.count).to eq(2)

      rdm = Readme.first

      delete "/readmes/#{rdm.id}"

      # status code
      expect(response).to have_http_status(410)

      expect(Readme.count).to eq(1)
    end
  end

  private
  
  def readme_params
    params.require(:readme).permit(:name, :age, :gender, :gender_pref, :location, :programming_language, :image, :user_id)
  end