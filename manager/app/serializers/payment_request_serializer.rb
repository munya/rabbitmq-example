# frozen_string_literal: true

class PaymentRequestSerializer < ActiveModel::Serializer
  attributes :id,
             :event_status

  def event_status
    return 'accept' if object.accepted?
    return  'reject' if object.rejected?
  end
  
  def id
    object.contractor_uid
  end
end
