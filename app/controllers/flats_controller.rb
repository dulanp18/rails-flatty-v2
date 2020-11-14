class FlatsController < ApplicationController

  def index
  end

  def new
    @flat = Flat.new()
    @tenant = Tenant.new()
  end

  def show
    @flat = Flat.find(params[:id])
    @tenant = @flat.tenants
  end

  def create
   @flat = Flat.new(flat_params)
   @flat.current_tenants_num = 1
   @flat.save


   @tenant = Tenant.new
   @tenant.flat = @flat
   @tenant.user = current_user
   params[:other][:head_tenant] == 'true' ? @tenant.head_tenant = true : @tenant.head_tenant = false
   params[:other][:agreement_type] == 'Lease' ? @tenant.tenant_agreement_type = "lease" : @tenant.tenant_agreement_type = "flatmate"
   @tenant.save
   redirect_to home_path
  end

  def home
    @tenant = current_user.tenant
    if !@tenant.nil?
      @flat = @tenant.flat
    end
  end



  private

  def flat_params
    params.require(:flat).permit(:street_address, :suburb, :city, :post_code, :country, :max_tenants_nums, :lease_start_date, :length_of_lease)
  end
end
