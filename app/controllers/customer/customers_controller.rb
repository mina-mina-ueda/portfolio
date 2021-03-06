class Customer::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to posts_path, notice: "会員情報を更新しました！"
    else
      render :edit
    end
  end

  def unsubscribe
    @customer = Customer.find_by(params[:id])
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to posts_path
  end

  private
  def customer_params
    params.require(:customer).permit(:nickname, :age, :gender, :work, :access, :customer_id, :email, :is_deleted)
  end


end
