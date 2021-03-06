class User < ApplicationRecord
  attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :authentication_keys => [:login]

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    p conditions
    if login = conditions.delete(:login)
      p "login"
      where(conditions).where(['username = :value OR lower(email) = lower(:value)', { value: login }]).first
    else
      p "else login"
      where(conditions).first
    end
  end

  validates :username,
            uniqueness: { case_sensitive: :false },
            length: { minimum: 4, maximum: 20 }
end
