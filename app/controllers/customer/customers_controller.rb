class Customer::CustomersController < ApplicationController
  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to posts_path, notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: false)
    reset_session
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:nickname, :age, :gender, :work, :access, :customer_id)
  end


end
