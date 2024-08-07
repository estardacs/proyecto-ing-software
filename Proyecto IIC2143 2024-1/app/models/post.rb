class Post < ApplicationRecord
  before_validation :generate_id_publicacion, on: :create
  belongs_to :user
  has_many :trips, dependent: :destroy
  has_one :chat, dependent: :destroy
  has_many :reviews, dependent: :destroy


  validates :id_publicacion, presence: true, uniqueness: true
  validates :fecha, presence: true
  validates :hora, presence: true
  validates :cupos, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :campus, presence: true
  validates :salida, presence: true
  validates :llegada, presence: true
  validates :comuna, presence: true
  private

  def generate_id_publicacion
    self.id_publicacion = SecureRandom.uuid
  end
end
