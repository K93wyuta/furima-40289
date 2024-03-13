class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only:[:index,:create]
  before_action :move_to_index, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(buyer_id: current_user.id, item_id: params[:item_id] ,token: params[:token])
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if Record.exists?(item_id: @item.id) || current_user == @item.user
      redirect_to root_path
    end
  end

  def pay_item
    item = Item.find(order_params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

end