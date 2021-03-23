class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :show_time

  validates_with TicketValidator
end
