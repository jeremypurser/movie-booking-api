# frozen_string_literal: true

module Api::V1
  class TicketsController < ApiController
    # POST /api/v1/tickets
    def create
      Ticket.transaction do
        return error_response('cannot book more than 10 tickets at once') if too_many_tickets?

        ticket = TicketProcessor.call(ticket_params)

        if ticket
          success_response(data: ticket, status: 201, meta: created_meta(ticket))
        else
          error_response(ticket.errors.messages)
        end
      end
    end

    private

    def ticket_params
      params.permit(:show_time_id, :user_id, :tickets)
    end

    def too_many_tickets?
      ticket_params[:tickets].to_i > 10
    end

    def created_meta(ticket)
      { ticket_count: ticket.is_a?(Array) ? ticket.count : 1 }
    end
  end
end
