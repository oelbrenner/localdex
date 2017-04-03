class CreateEpostcards < ActiveRecord::Migration[5.0]
  def change
    create_table :epostcards do |t|
      t.text :name
      t.text :main_image
      t.references :page, foreign_key: true

      t.timestamps
    end
  end
end
