# frozen_string_literal: true

class TicketProcessor
  def self.call(params)
    new.create(params)
  end

  def create(params)
    tickets = params[:tickets]

    create_params = params.reject { |k| k == :tickets }

    if tickets > 10
      Ticket.new.errors.add('cannot book more than 10 tickets at a time')
    elsif tickets > 1
      Ticket.new(many_payloads(tickets))
    else
      Ticket.new(create_params)
    end
  end

  def many_payloads(tickets)
    new_params = []
    tickets.times do
      new_params.push(create_params)
    end
    new_params
  end
end
