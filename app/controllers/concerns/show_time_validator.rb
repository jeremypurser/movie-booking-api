# frozen_string_literal

class ShowTimeValidator < ActiveModel::Validator
  def validate(record)
    record.errors.add(:start_time, 'start_time must be in the future') unless start_time_future?(record)
    record.errors.add(:start_time, 'start_time overlaps with another show_time') if start_time_collision?(record)
    record.errors.add(:end_time, 'end_time overlaps with another show_time') if end_time_collision?(record)
    record.errors.add(:movie, 'must not be within buffer_time of other show_time') unless sufficent_time_gap?(record)
    record.errors.add(:movie, 'not enough time for the runtime') unless sufficient_play_length?(record)
  end

  private

  def start_time_future?(record)
    record.start_time > Time.now
  end

  def show_times(record)
    record.movie.show_times
  end

  def start_time_collision?(record)
    show_times = show_times(record)

    return false if show_times.empty?

    show_times.all? do |st|
      record.start_time > st.start_time && record.start_time < st.end_time
    end
  end

  def end_time_collision?(record)
    show_times = show_times(record)

    return false if show_times.empty?

    show_times.all? do |st|
      record.end_time > st.start_time && record.end_time < st.end_time
    end
  end

  def sufficent_time_gap?(record)
    show_times = show_times(record)

    return true if show_times.empty?

    show_times.all? do |show_time|
      if record.end_time < show_time.start_time
        record.end_time < (show_time.start_time - 20.minutes)
      elsif record.start_time > show_time.end_time
        record.start_time > (show_time.end_time + 20.minutes)
      end
    end
  end

  def sufficient_play_length?(record)
    time_alotted = (record.end_time - record.start_time) / 60

    time_alotted > record.movie.runtime
  end
end
