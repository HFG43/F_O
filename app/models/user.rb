class User < ApplicationRecord
  has_one_attached :profile_image
  belongs_to :family
end
