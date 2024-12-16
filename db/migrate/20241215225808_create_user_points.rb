class CreateUserPoints < ActiveRecord::Migration[7.1]
  def change
    create_table :user_points do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :points

      t.timestamps
    end
  end
end
