class Lodging < ApplicationRecord
  belongs_to :user, optional: true
  has_many :pages

  def self.search(term)
    if term
      where('company_name LIKE ?', "%#{term}%")
    else
      order('company_name ASC')
    end
  end

end
