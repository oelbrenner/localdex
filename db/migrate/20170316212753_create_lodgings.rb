class CreateLodgings < ActiveRecord::Migration[5.0]
  def change
    create_table :lodgings do |t|
      t.string :destination_ref
      t.string :region_ref
      t.string :company_name
      t.string :address_line_one
      t.string :address_line_two
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :reservation
      t.string :fax
      t.string :url
      t.string :contact
      t.string :season
      t.string :email
      t.string :details
      t.string :mask2id_ref
      t.string :customer_status_notes
      t.datetime :expires_at
      t.datetime :paid_at
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
