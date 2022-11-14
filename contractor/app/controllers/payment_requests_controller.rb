class PaymentRequestsController < ApplicationController
  before_action :set_payment_request, only: %i[ destroy ]

  # GET /payment_requests 
  def index
    @payment_requests = PaymentRequest.all
  end

  # GET /payment_requests/new
  def new
    @payment_request = PaymentRequest.new
  end

  # POST /payment_requests 
  def create
    @payment_request = PaymentRequest.new(payment_request_params)

    respond_to do |format|
      if @payment_request.save
        Publisher.publish("payment_requests", PaymentRequestSerializer.new(@payment_request).serializable_hash)
        format.html { redirect_to payment_requests_url, notice: "Payment request was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_requests/1 
  def destroy
    @payment_request.destroy

    respond_to do |format|
      format.html { redirect_to payment_requests_url, notice: "Payment request was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_request
      @payment_request = PaymentRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def payment_request_params
      params.require(:payment_request).permit(:amount, :currency, :description)
    end
end
