class Customer::CustomersController < ApplicationController
  def edit
    @customer = Customer.find(params[:id])
  end

  def update
  end

  def withdraw
  end

  def unsubscribe
  end

  def post_params
    params.require(:customer).permit(:nickname, :age, :gender, :work, :access, :customer_id)
  end


end
