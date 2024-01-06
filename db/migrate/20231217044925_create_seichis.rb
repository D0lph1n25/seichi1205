class CreateSeichis < ActiveRecord::Migration[7.0]
  def change
    create_table :seichis do |t|
      t.string     :title,  null: false
      t.text       :introduction,  null: false
      t.integer    :category_id, null: false
      t.integer    :prefecture_id, null: false
      t.string     :addresses, null: false
      t.float      :latitude, null: false
      t.float      :longitude, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
