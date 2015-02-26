module ApplicationHelper
  def nav_link_to(title, path, options = {})
    if current_page?(path) and options[:class]
      options[:class] += ' active'
    end
    link_to(title, path, options)
  end
end
