class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.datetime :date_purchased
      t.references :category, foreign_key: true
      t.text :specs

      t.timestamps
    end
  end
end
