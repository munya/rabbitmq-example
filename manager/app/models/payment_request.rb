class PaymentRequest < ApplicationRecord
  validates :amount, numericality: { greater_than: 0, only_integer: true  }
  validates :currency, inclusion: { in: %w(USD EUR)}
  validates :description, presence: true

  state_machine :status, initial: :pending do
    event :accept do
      transition %i[pending] => :accepted
    end

    event :reject do
      transition %i[pending] => :rejected
    end
  end
end
