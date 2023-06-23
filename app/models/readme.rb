class Readme < ApplicationRecord
  belongs_to :user
  validates :name, :age, :gender, :gender_preference, :location, :language_preference, :image, presence true
end
