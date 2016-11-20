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
end
