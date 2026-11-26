class Booking < ApplicationRecord
  belongs_to :client
  belongs_to :training
end
