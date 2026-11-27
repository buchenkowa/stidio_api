class Training < ApplicationRecord
  belongs_to :trainer, class_name: "User"
  has_many :bookings
  has_many :clients, through: :bookings, source: :client

  validates :title, :starts_at, presence: true
  validates :capacity, numericality: { greater_than: 0 }

  def free_seats
    capacity - bookings.where.not(status: "cancelled").count
  end
end
