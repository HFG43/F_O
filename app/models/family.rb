class Family < ApplicationRecord
  has_many :users, dependent: :destroy
  has_one_attached :family_image

  validates :family_name, presence: true, uniqueness: { message: "This Family is already registered with this name: %{value}" }
end
