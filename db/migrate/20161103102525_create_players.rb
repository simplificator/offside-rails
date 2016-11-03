class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :first_name      , null: false
      t.string :last_name       , null: false
      t.string :image_url       , null: true

      t.timestamps
    end
  end
end
