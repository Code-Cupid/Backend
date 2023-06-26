class Readme < ApplicationRecord
  belongs_to :user
  validates  :name, :age, :gender, :gender_preference, :location, :programming_language, :image, :user_id, presence: true
end
