class OrdersController < ApplicationController

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:user_id, :item_id, :postal_code, :prefecture, :municipality, :address, :telephone_number, :order_id).merge(user_id: current_user.id)
  end

end
