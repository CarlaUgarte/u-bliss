class CreateLibraries < ActiveRecord::Migration[7.1]
  def change
    create_table :libraries do |t|
      t.references :user, null: false, foreign_key: true
      t.references :syllabus, null: false, foreign_key: true

      t.timestamps
    end
  end
end
