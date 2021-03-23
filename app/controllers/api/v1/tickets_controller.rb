# frozen_string_literal: true

module Api::V1
  class TicketsController < ApiController
    def create
      ticket = TicketProcessor.call(ticket_params)

      if ticket.save
        success_response(ticket, 201)
      else
        error_response(ticket.errors.messages)
      end
    end

    private

    def ticket_params
      params.permit(:show_time_id, :user_id, :tickets)
    end
  end
end
