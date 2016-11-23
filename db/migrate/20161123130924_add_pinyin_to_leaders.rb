class AddPinyinToLeaders < ActiveRecord::Migration[5.0]
  def change
    add_column :leaders, :pinyin, :string
  end
end
