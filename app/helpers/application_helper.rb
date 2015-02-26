module ApplicationHelper
  def nav_link_to(title, path, options = {})
    options[:class] += ' active' if current_page?(path)
    link_to(title, path, options)
  end
end
