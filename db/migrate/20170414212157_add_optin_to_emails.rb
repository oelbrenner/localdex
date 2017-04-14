class AddOptinToEmails < ActiveRecord::Migration[5.0]
  def change
    add_column :emails, :opt_in, :boolean
  end
end
