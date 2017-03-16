class User < ApplicationRecord
  devise :invitable, :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
end
