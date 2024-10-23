class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :class_statuses
  has_many :users, :through => :class_statuses
	
# 현재 학점 수 계산 메서드
  def current_credits
    ClassStatus.where(user_id: id).joins(:class_list).sum(:credits) || 0
  end

  # 추가 학점을 추가할 수 있는지 확인하는 메서드
  def can_add_credits?(new_credits)
    (current_credits + new_credits) <= max_credits
  end

end
