#virtaul fields => password and password_confirmation and thy both string fields
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :devices
  
  def user_name
    self.email.split("@")[0]
  end
end
