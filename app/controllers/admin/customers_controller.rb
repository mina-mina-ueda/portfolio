class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customer = Customer.page(params[:page]).reverse_order
  end

  def customer_params
    params.require(:customer).permit(:nickname, :age, :gender, :work, :access)
  end
end
