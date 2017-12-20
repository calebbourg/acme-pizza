class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders

  def cashier?
    roles.keys.include?('cashier')
  end

  def baker?
    roles.keys.include?('baker')
  end
end
