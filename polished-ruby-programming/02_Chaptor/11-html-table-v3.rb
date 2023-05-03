class HTMLTable
  # wrap method to simplify the process of wrapping content with HTML tags.
  # This method takes an html string and a type argument representing the HTML tag name,
  # and it uses a block to generate the content that should be wrapped.
  def wrap(html, type)
    html << "<" << type << ">"
    yield
    html << "</" << type << ">"
  end

  # initialize(rows): Initializes the HTMLTable object with the given array of rows.
  # This method generates the HTML string representation of the table.

  # It uses nested wrap method calls to create the table, tbody, tr, and td elements while iterating through the rows and cells.
  # The cell content is escaped using CGI.escapeHTML before being appended to the html string.
  def to_s
    html = String.new
    wrap(html, 'table') do
      wrap(html, 'tbody') do
        @rows.each do |row|
          wrap(html, 'tr') do
            row.each do |cell|
              wrap(html, 'td') do
                html << CGI.escapeHTML(cell.to_s)
              end
            end
          end
        end
      end
    end
  end
end