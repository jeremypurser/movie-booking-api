class Ticket < ApplicationRecord
  belongs_to :movie
  belongs_to :show_time

  validates_with TicketValidator
end
