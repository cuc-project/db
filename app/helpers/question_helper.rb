module QuestionHelper
  def highlight_search(text, terms)
    return text unless terms

    #TODO: please fix this, i feel very bad about it
    #TODO: I tried replacing it with Rails' highlight, but it didn't work.
    prefix = "%<%"
    postfix = "%>%"
    terms.sort_by { |i| -i.length }.each do |term|
      match = text.match(/#{term}/i)[0].to_s
      text.gsub!(match, prefix + match + postfix)
    end
    text.gsub!(prefix, "<span class=match>")
    text.gsub!(postfix, "</span>")

    text
  end
end
