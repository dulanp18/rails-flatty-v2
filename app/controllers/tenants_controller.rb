class TenantsController < ApplicationController
  def index

    @tenants = Tenant.all
  end

  def find
    sql_query = "email ILIKE :query OR last_name ILIKE :query OR first_name ILIKE :query"
    if params[:query].present?
      @users = User.where(sql_query, query: "%#{params[:query]}%")
    else
      @users = User.all
    end
  end

end
