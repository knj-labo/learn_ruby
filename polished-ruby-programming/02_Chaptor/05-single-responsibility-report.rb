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

class ReportFormatter
  def self.for_type(report_type)
    case report_type
    when :simple
      SimpleReportFormatter
    when :advanced
      AdvancedReportFormatter
    else
      raise ArgumentError, "Unsupported report type: #{report_type}"
    end
  end
end

class SimpleReportFormatter
  def format(report_content)
    "Simple Report: #{report_content.data}"
  end
end

class AdvancedReportFormatter
  def format(report_content)
    "Advanced Report: #{report_content.data.upcase}"
  end
end