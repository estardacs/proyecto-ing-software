class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :chat
end
