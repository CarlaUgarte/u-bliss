class CreateSyllabusModules < ActiveRecord::Migration[7.1]
  def change
    create_table :syllabus_modules do |t|
      t.string :name
      t.references :syllabus, null: false, foreign_key: true

      t.timestamps
    end
  end
end
