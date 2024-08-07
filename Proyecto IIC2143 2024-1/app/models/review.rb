class Review < ApplicationRecord
  belongs_to :reviewer, class_name: 'User', foreign_key: 'reviewer_id'
  belongs_to :reviewed_user, class_name: 'User', foreign_key: 'reviewed_user_id'
  
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
  end