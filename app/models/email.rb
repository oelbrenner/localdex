class Email < ApplicationRecord
  belongs_to :epostcard
  belongs_to :lodging
end
