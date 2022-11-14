# frozen_string_literal: true

class PaymentRequestSerializer < ActiveModel::Serializer
  attributes :id,
             :amount,
             :currency,
             :description
end
