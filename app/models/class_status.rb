class ClassStatus < ApplicationRecord
  belongs_to :user
  belongs_to :class_list
end
