class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.json :data

      t.timestamps null: false
    end
  end
end
