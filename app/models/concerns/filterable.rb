# frozen_string_literail: true

module Filterable
  extend ActiveSupport::Concern

  def filter(filtering_params)
    results = where(nil)
    filtering_params.each do |key, value|
      results = results.public_send("filter_by_#{key}", value) if value.present?
    end
    results
  end
end
