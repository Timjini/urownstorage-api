class User < ApplicationRecord
  has_secure_password
  has_secure_password :recovery_password, validations: false

  # Relations
  has_many :addresses

  # Callbacks
  before_save { self.email = email.downcase }

  # Validations
  validates :email, presence: true
  validates :password, length: { minimum: 8 }, if: -> { password.present? }
  validate :password_complexity
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  private

  def password_complexity
    return if password.blank?

    unless password.match?(/(?=.*[A-Z])(?=.*[0-9])/)
      errors.add :password, "must include at least one uppercase letter and one digit"
    end
  end
end
