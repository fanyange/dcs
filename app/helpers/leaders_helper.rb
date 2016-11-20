module LeadersHelper
  def todo_ins_count(leader)
    ins = leader.instructions
    ins.where.not(deadline: nil).count
  end

  def level(number_todo)
    case number_todo
    when 0 then 'success'
    when 1..5 then 'warning'
    else 'danger'
    end
  end
end
