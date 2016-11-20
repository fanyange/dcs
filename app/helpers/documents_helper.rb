module DocumentsHelper
  def timeago(t)
    delta = (t - Date.today).to_i
    if delta >= 0
      ["还有#{delta}天", 'warning']
    else
      ["已过#{-delta}天", 'danger']
    end
  end
end
