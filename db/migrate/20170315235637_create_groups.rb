
class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :code
      t.string :description
      t.boolean :active

      t.timestamps null: false
    end
  end
end
