class Contact < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :email, uniqueness: true

  belongs_to :user
  has_many :group_contacts
  has_many :groups, through: :group_contacts

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def friendly_updated_at
    updated_at.strftime("%b %d, %Y")
  end
end
