module ApplicationHelper
  def full_title(title)
    pre = 'Baiwale'
    if title.empty?
      pre
    else
      "#{pre} | #{title}"
    end
  end
end
