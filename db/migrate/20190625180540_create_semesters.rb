class CreateSemesters < ActiveRecord::Migration[5.2]
  def change
    create_table :semesters do |t|
      t.string :name, null: false, index: true
      t.string :credits
      t.datetime :start_date
      t.datetime :end_date
      t.references :created_by, null: false
      t.references :updated_by, null: false
      t.timestamps
    end
  end
end
