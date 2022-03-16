require 'date'

class Meetup
  WEEKDAYS = [
    'sunday',
    'monday',
    'tuesday',
    'wednesday',
    'thursday',
    'friday',
    'saturday'
  ].freeze

  DESCRIPTOR = {
    first: 0,
    second: 1,
    third: 2,
    fourth: 3,
    fifth: 4,
    teenth: (13..19),
    last: -1
  }.freeze

  attr_reader :year, :month

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, schedule)
    schedule = schedule.downcase.to_sym
    raise ArgumentError unless DESCRIPTOR.key?(schedule)
    descriptor = DESCRIPTOR[schedule]

    weekdays_of_the_month = matching_weekdays(weekday)
    if schedule == :teenth
      weekdays_of_the_month.find { |date| descriptor.include? date.day }
    else
      weekdays_of_the_month[descriptor]
    end
  end

  private

  def matching_weekdays(weekday)
    weekday = weekday.downcase
    raise ArgumentError unless WEEKDAYS.include?(weekday)
    weekday_number = WEEKDAYS.index(weekday)

    first_of_month = Date.civil(year, month)
    last_of_month = first_of_month.next_month.prev_day

    first_of_month.upto(last_of_month).select do |date|
      date.wday == weekday_number
    end
  end
end
