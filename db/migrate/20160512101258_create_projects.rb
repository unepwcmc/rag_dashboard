class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.json :data

      t.timestamps null: false
    end
  end
end
