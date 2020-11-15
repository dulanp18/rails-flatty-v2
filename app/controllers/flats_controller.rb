class FlatsController < ApplicationController

  def index
    @flats = Flat.all
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
   @flat.save


   @tenant = Tenant.new
   @tenant.flat = @flat
   @flat.current_tenants_num += 1
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
      @tenants = @flat.tenants
    end
  end

  def join
    flat = current_user.tenant.flat
    new_tenant = User.find(params[:user][:id])
    tenant = Tenant.new
    tenant.user = new_tenant
    tenant.flat = flat
    tenant.tenant_agreement_type = 'lease' if params[:user][:agreement] == 'lease'
    tenant.tenant_agreement_type = 'flatmate' if params[:user][:agreement] == 'flatmate'
    tenant.head_tenant = false
    if tenant.save
      flat.current_tenants_num += 1
      flat.save
    end


    redirect_to home_path

  end



  private

  def flat_params
    params.require(:flat).permit(:street_address, :suburb, :city, :post_code, :country, :max_tenants_nums, :lease_start_date, :length_of_lease)
  end
end
