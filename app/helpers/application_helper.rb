module ApplicationHelper
  def level(number_todo)
    case number_todo
    when 0 then 'default'
    when 1..5 then 'warning'
    else 'danger'
    end
  end
end
