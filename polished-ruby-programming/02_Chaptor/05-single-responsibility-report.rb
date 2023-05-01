class Report
  def initialize(data)
    @data = data
  end

  def format
    # Here, you can implement your custom formatting logic for the report.
    # For example, you can format the data as a string.
    "Report data: #{@data}"
  end
end

data = "Sample report data"
report = Report.new(data)
puts report.format

class ReportContent
  # Creates instance variables and corresponding methods that return the value of each instance variable.
  # Equivalent to calling “attr:name'' on each name in turn. String arguments are converted to symbols.
  attr_reader :data

  def initialize(data)
    @data = data
  end
end