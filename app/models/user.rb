class User < ApplicationRecord

  has_many :posts, dependent: :destroy

  validation :last_name, presence: true
end
