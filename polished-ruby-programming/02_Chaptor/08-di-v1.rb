class CurrentDay
  def initialize(date: Date.today,
                 schedule_class: MonthlySchedule)
    @date = date
    @schedule = schedule_class.new(date.year, date.month)
  end

  def work_hours
    @schedule.work_hours_for(@date)
  end

  def workday?
    !@schedule.holidays.include?(@date)
  end
end

class MonthlySchedule
  attr_reader :holidays

  def initialize(year, month)
    @year = year
    @month = month
    @holidays = calculate_holidays
    @work_hours = default_work_hours
  end

  def work_hours_for(date)
    @work_hours[date.day - 1]
  end

  private

  def default_work_hours
    Array.new(Date.new(@year, @month, -1).day, 8)
  end

  def calculate_holidays
    # Replace this with your actual holiday calculation logic
    [Date.new(@year, @month, 1), Date.new(@year, @month, 25)]
  end
end