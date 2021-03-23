# frozen_string_literal: true

class TicketProcessor
  def self.call(params)
    new(params).create
  end

  def initialize(params)
    @tickets = params[:tickets]
    @create_params = params.reject { |k| k == 'tickets' }
  end

  def create
    if @tickets > 1
      many_payloads
    else
      Ticket.create(@create_params)
    end
  end

  private

  def many_payloads
    new_params = []
    @tickets.times do
      new_params.push(@create_params)
    end

    Ticket.create(new_params)
  end
end
