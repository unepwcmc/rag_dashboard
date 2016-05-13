class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.json :data

      t.timestamps null: false
    end
  end
end
