module LeadersHelper
  def todo_ins_count(leader)
    ins = leader.instructions
    ins.where.not(deadline: nil).count
  end


  def leader_option(leader, f)
    leader_id_map = { f.object.leader_id => true }
    content_tag(:option, leader.name, value: leader.id, selected: leader_id_map[leader.id], data: { subtext: leader.pinyin })
  end
end
