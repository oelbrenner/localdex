class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :content_header
      t.string :content_one
      t.string :content_two
      t.string :type
      t.boolean :active
      t.references :lodging, foreign_key: true

      t.timestamps
    end
  end
end
