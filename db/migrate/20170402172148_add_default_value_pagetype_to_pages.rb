class AddDefaultValuePagetypeToPages < ActiveRecord::Migration[5.0]
  def change
    change_column_default :pages, :page_type, 'e-postcard'
  end
end
