require 'cgi/escape'

class HTMLTable
  # initialize(rows): Initializes the HTMLTable object with the given array of rows.
  def initialize(rows)
    @rows = rows
  end

  #  This method generates an HTML string representation of the table.
  # It iterates through the rows and cells, escaping the cell content using CGI.escapeHTML
  # to ensure that any special HTML characters are properly escaped. The method returns the final HTML string.
  def to_s
    html = String.new
    html << "<table><tbody>"
    @rows.each do |row|
      html << "<tr>"
      row.each do |cell|
        html << "<td>" << CGI.escapeHTML(cell.to_s) << "</td>"
      end
      html << "</tr>"
    end
    html << "</tbody></table>"
  end
end

# table_data = [
#  ["Header 1", "Header 2", "Header 3"],
#  ["Row 1, Cell 1", "Row 1, Cell 2", "Row 1, Cell 3"],
#  ["Row 2, Cell 1", "Row 2, Cell 2", "Row 2, Cell 3"]
# ]

# table = HTMLTable.new(table_data)
# puts table.to_s
# the output would be:
# <table><tbody><tr><td>Header 1</td><td>Header 2</td><td>Header 3</td></tr><tr><td>Row 1, Cell 1</td><td>Row 1, Cell 2</td><td>Row 1, Cell 3</td></tr><tr><td>Row 2, Cell 1</td><td>Row 2, Cell 2</td><td>Row 2, Cell 3</td></tr></tbody></table>