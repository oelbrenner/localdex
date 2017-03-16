class Lodging < ApplicationRecord
  belongs_to :user, optional: true
end
