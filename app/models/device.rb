class Device < ApplicationRecord
  
  before_validation :generate_reference
  before_validation :generate_password
  #before_validation :password_digest, :password
  #has_secure_password 
  belongs_to :user, foreign_key: 'user_id'

  attr_accessor :password

  def generate_reference
    self.reference = SecureRandom.hex(8)
    puts "self.reference = #{self.reference}"
  end

  def generate_password
    self.password =  SecureRandom.hex(10)
    puts "self.password = #{self.password}"
  end
end
