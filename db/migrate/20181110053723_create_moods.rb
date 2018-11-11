class CreateMoods < ActiveRecord::Migration[5.2]
  def change
    create_table :moods do |t|
      t.integer :emotion
      t.integer :user_id
      t.string :message

      t.timestamps
    end
  end
end
