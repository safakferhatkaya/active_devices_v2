class Device < ApplicationRecord
  before_create :generate_reference
  before_create :generate_password
  belongs_to :user, foreign_key: 'user_id'

  def generate_reference
    self.reference = SecureRandom.hex(10)
  end

  def generate_password
    self.password = SecureRandom.hex(10)
  end
end
