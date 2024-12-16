class CreateAchievements < ActiveRecord::Migration[7.1]
  def change
    create_table :achievements do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.datetime :achieved_at

      t.timestamps
    end
  end
end
