# frozen_string_literal: true

class TicketValidator < ActiveModel::Validator
  def validate(record)
    record.errors.add(:show_time_id, 'no tickets available') if record.show_time.tickets_available?
  end
end
