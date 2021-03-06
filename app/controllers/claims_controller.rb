class ClaimsController < ApplicationController
  before_action :load_resources

  def index
    @claims = Claim.all
  end

  def new
    @claim = Claim.new
  end

  def create
    @claim = Claim.new(claim_params)

    if @@claim.save
      ClaimMailer.with(claim: @claim).request_inspection_call.deliver

      redirect_to adjuster_inspection_calls_path(token: @@claim.token)
    else
      render :new
    end
  end

  def show; end

  private

  def claim_params
    params.require(:claim).permit(:claim_number, :claimant_contact)
  end
end
