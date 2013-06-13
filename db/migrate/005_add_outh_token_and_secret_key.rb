class AddOuthTokenAndSecretKey < ActiveRecord::Migration
  def up
   add_column :users, :oauth_token, :string
   add_column :users, :oauth_secret, :string
  end

  def down
  end
end
