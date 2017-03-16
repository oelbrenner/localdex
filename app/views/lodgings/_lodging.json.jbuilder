json.extract! lodging, :id, :destination_ref, :region_ref, :company_name, :address_line_one, :address_line_two, :city, :state, :zip, :phone, :reservation, :fax, :url, :contact, :season, :email, :details, :mask2id_ref, :expires_at, :paid_at, :customer_status_notes, :user_id, :created_at, :updated_at
json.url lodging_url(lodging, format: :json)
