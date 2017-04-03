class Page < ApplicationRecord
  belongs_to :lodging
  has_many :epostcards
  accepts_nested_attributes_for :epostcards
end
