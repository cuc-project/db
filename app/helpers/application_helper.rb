module ApplicationHelper
  def nav_link_to(title, path, options = {})
    if current_page?(path)
      if options[:class]
        options[:class] += " active"
      else
        options[:class] = "active"
      end
    end
    link_to(title, path, options)
  end
end
