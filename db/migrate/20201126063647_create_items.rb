class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,                  null: false
      t.text    :description,           null: false
      t.integer :price,                 null: false
      t.integer :status_id,             null: false
      t.integer :fee_id,                null: false
      t.integer :category_id,           null: false
      t.integer :ship_form_id,          null: false
      t.integer :day_to_ship_id,        null: false
      t.integer :user_id,               null: false, foreign_key: true
      t.timestamps
    end
  end
end

