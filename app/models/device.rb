class Device < ApplicationRecord
  
  before_validation :generate_reference
  before_validation :generate_password
  after_create_commit { broadcast_append_to "devices" }
  after_update_commit { broadcast_replace_to "devices" }
  after_destroy_commit { broadcast_remove_to "devices" }
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
