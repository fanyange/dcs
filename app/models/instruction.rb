# == Schema Information
#
# Table name: instructions
#
#  id          :integer          not null, primary key
#  content     :text
#  deadline    :date
#  document_id :integer
#  leader_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Instruction < ApplicationRecord
  belongs_to :document, touch: true
  belongs_to :leader

  scope :of, ->(user) { joins(document: [:user]).where('users.group_id = ?', user.group_id) }

  validates :content, presence: { message: '批示内容不能为空' }
  validates :leader_id, presence: true
end
