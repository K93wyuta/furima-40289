class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    binding.pry
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number, :record_id, :buyer_id, :item_id)
  end

end