class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :matricula
      t.string :email
      t.datetime :birth_date
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
