class ClassStatus < ApplicationRecord
  belongs_to :user
  belongs_to :class_list

  # 중복 신청 여부 확인하는 메서드
  def overlap?
    self.class.where(user_id: user_id, class_list_id: class_list_id).exists?
  end

  # 수강 인원이 초과하는지 확인하는 메서드
  def full?
    self.class.where(class_list_id: class_list_id).count >= ClassList.find(class_list_id).c_account
  end
  # 사용자의 최대 학점 수를 확인하는 메서드
  public
  def can_user_add_credits?
    user.can_add_credits?(class_list.credits || 0)
  end
end
