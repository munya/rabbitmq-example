class PaymentRequestsController < ApplicationController
  before_action :set_payment_request, only: %i[ accept reject ]

  # GET /payment_requests 
  def index
    @payment_requests = PaymentRequest.all
  end

  def accept
    if @payment_request.accept
      Publisher.publish('payment_requests', PaymentRequestSerializer.new(@payment_request).serializable_hash)
    end  
    redirect_to payment_requests_url
  end

  def reject
    if @payment_request.reject
      Publisher.publish('payment_requests', PaymentRequestSerializer.new(@payment_request).serializable_hash)
    end  
    redirect_to payment_requests_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_request
      @payment_request = PaymentRequest.find(params[:payment_request_id])
    end
  end
