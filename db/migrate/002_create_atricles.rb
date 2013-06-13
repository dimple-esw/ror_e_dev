class CreateAtricles < ActiveRecord::Migration
  def change
    create_table :atricles do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
