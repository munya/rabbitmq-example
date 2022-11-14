class PaymentRequestsWorker
  include Sneakers::Worker
  
  from_queue "manager_updates.payment_requests", env: nil
  
  def work(raw_data)
    begin
      attributes = JSON.parse(raw_data).with_indifferent_access
      PaymentRequest.find(attributes[:id]).public_send(attributes[:event_status])
    rescue StandardError => e
      Logger.debug("Exception to change status: #{raw_data}")
    end  
    ack!
  end  
end  