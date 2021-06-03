class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name
      t.text       :explain
      t.integer    :category_id
      t.integer    :condition_id
      t.integer    :shipping_charge_id
      t.integer    :shipping_area_id
      t.integer    :shipping_time_id
      t.integer    :price
      t.references :user,                foreign_key: true
      t.timestamps
    end
  end
end
