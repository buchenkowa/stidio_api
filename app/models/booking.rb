class Booking < ApplicationRecord
  belongs_to :client, class_name: "User"
  belongs_to :training

  enum :status, { booked: "booked", attended: "attended", missed: "missed", cancelled: "cancelled" }

  validates :training_id, uniqueness: { scope: :client_id }
end
