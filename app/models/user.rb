class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  scope :qa_dev, -> { where("type IN (?)", ["Developer", "Qa"]) }

  def manager?
   self.type == 'Manager'
  end

  def qa?
   self.type == 'Qa'
  end

  def developer?
    self.type == "Developer"
  end
end
