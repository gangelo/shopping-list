# frozen_string_literal: true

class User < ApplicationRecord
  before_save :normalize

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable

  validates :first_name, :last_name, length: { maximum: 32 }, allow_blank: true

  def admin?
    false
  end

  def full_name?
    first_name.present? && last_name.present?
  end

  def full_name_or_email
    return "#{first_name} #{last_name}" if full_name?

    email
  end

  private

  def normalize
    self.first_name = first_name&.capitalize
    self.last_name = last_name&.capitalize
    self.email = email.downcase
  end
end
