# frozen_string_literal: true

module Api::V1
  class MovieSerializer < ApplicationSerializer
    attributes :id, :name, :runtime, :buffer, :details, :show_times

    def show_times
      future_show_times = object.show_times.select { |s| s.start_time > Time.now }

      future_show_times.map do |show_time|
        ShowTimeSerializer.new(show_time)
      end
    end
  end
end
