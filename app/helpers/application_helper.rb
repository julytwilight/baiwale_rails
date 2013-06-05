module ApplicationHelper
  def full_title(title)
    pre = 'Baiwale'
    if title.empty?
      pre
    else
      "#{title} | #{pre}"
    end
  end
end
