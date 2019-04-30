class User < ApplicationRecord
  validate :pincode_valid?
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products, dependent: :destroy
  has_one :shop

  def admin?
    self.role_id.eql?(1)
  end

  def products
    if self.role_id.eql?(1)
      @products ||= Product.all
    elsif self.role_id.eql?(2)
      @products ||= Product.joins(:user).where(users: {pincode: self.pincode})
    elsif self.role.eql?(3)
      @products ||= Product.where(user_id: self.id)
    end
  end

  def pincode_valid?
    if role_id.eql?(2) && User.where(pincode: self.pincode, id: self.id).length > 0
      errors.add(:pincode, 'Agents must have a unique pincode')
    elsif role_id.eql?(3) && User.where(pincode: self.pincode, role_id: 2).length.eql?(0)
      errors.add(:pincode, 'Pincode not valid, please contact an agent')
    end
  end
end
