class CreateEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :emails do |t|
      t.string :from_name
      t.string :from_email
      t.string :to_name
      t.string :to_email
      t.string :message
      t.datetime :sent_at
      t.datetime :failed_at
      t.integer :attempt_count
      t.references :epostcard, foreign_key: true
      t.references :lodging, foreign_key: true

      t.timestamps
    end
  end
end
