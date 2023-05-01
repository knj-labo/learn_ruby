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
