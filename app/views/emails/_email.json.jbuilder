json.extract! email, :id, :from_name, :from_email, :to_name, :to_email, :message, :sent_at, :failed_at, :attempt_count, :epostcard_id, :lodging_id, :created_at, :updated_at
json.url email_url(email, format: :json)
