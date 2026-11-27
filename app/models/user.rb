class User < ApplicationRecord
    has_secure_password

    enum :role, { admin: "admin", trainer: "trainer", client: "client" }

    # --- когда пользователь — клиент ---
    has_one  :client_profile
    has_many :bookings, foreign_key: :client_id
    has_many :booked_trainings, through: :bookings, source: :training

    # --- когда пользователь — тренер ---
    has_many :trainings, foreign_key: :trainer_id
    has_many :client_links, class_name: "TrainerClient", foreign_key: :trainer_id
    has_many :clients, through: :client_links, source: :client

    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
    validates :first_name, presence: true
end
