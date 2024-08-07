class Chat < ApplicationRecord
  belongs_to :post
  has_many :trips, dependent: :destroy
  has_many :messages, dependent: :destroy
end
