class CreateReadmes < ActiveRecord::Migration[7.0]
  def change
    create_table :readmes do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :gender_preference
      t.string :location
      t.string :programming_language
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
