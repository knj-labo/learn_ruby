# designed to filter values based on a specified time range.
class TimeFilter
  # This line defines getter methods for the start and finish attributes.
  attr_reader :start, :finish

  # This method initializes a new TimeFilter object with the specified start and finish times.
  def initialize(start, finish)
    @start = start
    @finish = finish
  end

  # This method returns a Proc object,
  # which can be used as a filter to check if a given value is within the specified time range.
  # The Proc object checks if the value is greater than or equal
  # to start and less than or equal to finish.
  # If either start or finish is not specified (i.e., nil), the filter does not apply that constraint.
  def to_proc
    start = self.start
    finish = self.finish

    proc do |value|
      next false if start && value < start
      next false if finish && value > finish
      true
    end
  end
end

end