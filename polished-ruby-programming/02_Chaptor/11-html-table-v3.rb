class HTMLTable
  # wrap method to simplify the process of wrapping content with HTML tags.
  # This method takes an html string and a type argument representing the HTML tag name,
  # and it uses a block to generate the content that should be wrapped.
  def wrap(html, type)
    html << "<" << type << ">"
    yield
    html << "</" << type << ">"
  end
end