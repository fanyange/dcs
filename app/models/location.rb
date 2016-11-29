# == Schema Information
#
# Table name: locations
#
#  id          :integer          not null, primary key
#  document_id :integer
#  leader_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Location < ApplicationRecord
  belongs_to :document, touch: true
  belongs_to :leader

  # validates :document_id, presence: true
  validates :leader_id, presence: true
end
