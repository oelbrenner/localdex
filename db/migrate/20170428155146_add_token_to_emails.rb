class AddTokenToEmails < ActiveRecord::Migration[5.0]
  def change
    add_column :emails, :send_token, :string
  end
end
