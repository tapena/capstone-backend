class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :family_id
      t.string :password_diges

      t.timestamps
    end
  end
end
