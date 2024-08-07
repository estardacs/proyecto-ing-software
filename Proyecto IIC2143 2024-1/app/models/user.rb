class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :n_tuc, presence: true
  validates :nombre_usuario, presence: true, length: { minimum: 1, message: "debe tener al menos un carácter" }
  validates :genero, presence: true, 
inclusion: { in: %w(Hombre Mujer Otros), message: "%{value} no es un género válido" }
  validate :email_format
  validate :n_tuc_format
  validates :descripcion, length: { maximum: 150, message: "debe tener un máximo de 150 carácteres" }, allow_blank: true

  has_many :posts, foreign_key: 'user_id'
  has_many :trips
  has_many :chats, through: :trips
  has_many :messages
  has_one_attached :image
  has_many :reviews_made, class_name: 'Review', foreign_key: 'reviewer_id'
  has_many :reviews_received, class_name: 'Review', foreign_key: 'reviewed_user_id'
  has_many :notifications

  private

  def email_format
    unless email =~ /\A[^@]+@uc\.cl\z/ && email.split('@').first.length > 1
      errors.add(:email, "debe tener el formato xxx@uc.cl y la parte 'xxx' debe ser mayor a 1 caracter")
    end
  end

  def n_tuc_format
    unless n_tuc =~ /\A\d{8}\z/ || n_tuc =~ /\A\d{7}j\z/
      errors.add(:n_tuc, "debe tener exactamente 7 caracteres y terminar con un dígito o la letra 'j'")
    end
  end
end
