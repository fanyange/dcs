# == Schema Information
#
# Table name: documents
#
#  id          :integer          not null, primary key
#  title       :string
#  number      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  self_number :string
#

class Document < ApplicationRecord
  has_many :instructions, dependent: :destroy
  has_many :locations, dependent: :destroy
  has_many :signed_leaders, through: :locations, source: :leader

  belongs_to :user

  scope :of, ->(user) { joins(:user).where('users.group_id = ?', user.group_id) }

  validates :title, presence: {message: '文件标题不能为空'}, uniqueness: {message: '此文件标题已存在'}
  validates :number, uniqueness: {message: '此收文字号已存在'}, allow_blank: true
  validates :self_number, uniqueness: {message: '此文号已存在'}, allow_blank: true
end
