class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name, null: false, index: true
      t.integer :age
      t.datetime :dob
      t.text :description
      t.references :semester, null: false
      t.references :created_by, null: false
      t.references :updated_by, null: false
      t.timestamps
    end
  end
end
