class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :screen_name 
      t.string :profile_image_url
      t.integer :user_id
      t.integer :vote
      t.timestamps
    end
  end
end
