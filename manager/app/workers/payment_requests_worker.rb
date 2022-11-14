class PaymentRequestsWorker
  include Sneakers::Worker
  
  from_queue "dashboard.payment_requests", env: nil
  
  def work(raw_data)
    attributes = JSON.parse(raw_data).with_indifferent_access
    begin
      PaymentRequest.create!(
        contractor_uid: attributes[:id],
        amount: attributes[:amount],
        currency: attributes[:currency],
        description: attributes[:description]
      )
    rescue StandardError => e
      Logger.debug("Exception to save: #{raw_data}")
    end  
    ack!
  end  
end  