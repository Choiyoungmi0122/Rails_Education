class ChangeColumn < ActiveRecord::Migration[6.0]
  def change
	  add_column(:class_lists, :class_explain, :text)
  end
end
