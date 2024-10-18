class ClassStatus < ApplicationRecord
  belongs_to :user
  belongs_to :class_list
	
  # 수강 인원이 초과하는지 확인하는 메서드
  def self.exceeds_capacity?(class_list_id)
    current_size = where(class_list_id: class_list_id).size
    max_capacity = ClassList.find(class_list_id).c_account
    current_size >= max_capacity
  end
	
	# 수강 신청 여부 확인하는 메서드
  def self.applied?(user_id, class_list_id)
    exists?(user_id: user_id, class_list_id: class_list_id)
  end
end
