require 'rails_helper'

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
  it 'should validate an age' do
    readme = user.readmes.create(
      name: 'Ernesto',
      gender: 'male',
      gender_preference: 'female',
      location: 'CA',
      programming_language: 'ruby',
      image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
    )
    expect(readme.errors[:age]).to include("can't be blank")
  end
  it 'should validate gender' do
    readme = user.readmes.create(
      age: '31',
      name: 'Ernesto',
      gender_preference: 'female',
      location: 'CA',
      programming_language: 'ruby',
      image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
    )
    expect(readme.errors[:gender]).to include("can't be blank")
  end
  it 'should validate gender_preference' do
    readme = user.readmes.create(
      age: '31',
      gender: 'male',
      name: 'Ernesto',
      location: 'CA',
      programming_language: 'ruby',
      image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
    )
    expect(readme.errors[:gender_preference]).to include("can't be blank")
  end
  it 'should validate location' do
    readme = user.readmes.create(
      age: '31',
      gender: 'male',
      gender_preference: 'female',
      name: 'Ernesto',
      programming_language: 'ruby',
      image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
    )
    expect(readme.errors[:location]).to include("can't be blank")
  end
  it 'should validate programming_language' do
    readme = user.readmes.create(
      age: '31',
      gender: 'male',
      gender_preference: 'female',
      location: 'CA',
      name: 'Ernesto',
      image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
    )
    expect(readme.errors[:programming_language]).to include("can't be blank")
  end
  it 'should validate image' do
    readme = user.readmes.create(
      age: '31',
      gender: 'male',
      gender_preference: 'female',
      location: 'CA',
      programming_language: 'ruby',
      name: 'Ernesto'
    )
    expect(readme.errors[:image]).to include("can't be blank")
  end
end