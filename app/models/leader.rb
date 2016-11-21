# == Schema Information
#
# Table name: leaders
#
#  id         :integer          not null, primary key
#  name       :string
#  position   :string
#  order      :integer
#  resume     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Leader < ApplicationRecord
  has_many :instructions, dependent: :destroy

  def working
    Document.joins(:signed_leaders).order('locations.created_at DESC').group(:id).having('leaders.id = ?', id)
  end
end
