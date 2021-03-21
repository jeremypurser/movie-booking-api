class ShowTimeProcessor
  def self.call(start_time:, end_time:, params:)
    show_time = new
    times = show_time.parse_times(start_time, end_time)
    show_time_params = params.merge(times)

    show_time.create(show_time_params)
  end

  def parse_times(start_time, end_time)
    {
      start_time: DateTime.parse(start_time),
      end_time: DateTime.parse(end_time)
    }
  end

  def create(params)
    ShowTime.new(params)
  end
end
