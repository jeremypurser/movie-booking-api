# frozen_string_literal

module Api::V1
  class TicketSerializer < ApplicationSerializer
    attributes :id, :show_time_id, :user_id
  end
end
