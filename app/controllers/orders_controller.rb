require_relative '../forms/order_form'

class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @order_form = OrderForm.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_form = OrderForm.new(order_params)
    @item = Item.find(params[:item_id])

    if @order_form.valid?
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
