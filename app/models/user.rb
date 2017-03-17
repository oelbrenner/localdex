class User < ApplicationRecord
  devise :invitable, :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  has_many :lodgings
  accepts_nested_attributes_for :lodgings
end
