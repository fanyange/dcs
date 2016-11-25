module LeadersHelper
  def todo_ins_count(leader)
    ins = leader.instructions
    if logged_in?
      ins = ins.of(current_user)
    end
    ins.where.not(deadline: nil).count
  end

  def working_doc_count(leader)
    docs = leader.working
    if logged_in?
      docs = docs.of(current_user)
    end
    docs.count.count
  end


  def leader_option(leader, f)
    leader_id_map = { f.object.leader_id => true }
    content_tag(:option, leader.name, value: leader.id, selected: leader_id_map[leader.id], data: { subtext: leader.pinyin })
  end
end
