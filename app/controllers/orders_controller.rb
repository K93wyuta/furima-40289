class OrdersController < ApplicationController
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
  before_action :authenticate_user!
  before_action :set_order, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
=======
  before_action :authenticate_user!, except: :index
>>>>>>> Stashed changes
=======
  before_action :authenticate_user!
  before_action :set_order, only:[:index,:create]
  before_action :move_to_index, only: [:index, :create]
>>>>>>> Stashed changes

  def index
<<<<<<< Updated upstream
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
=======
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
>>>>>>> Stashed changes
    @order = Order.new
  end

  def create
<<<<<<< Updated upstream
=======
    @item = Item.find(params[:item_id])
>>>>>>> Stashed changes
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
<<<<<<< Updated upstream
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
=======
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
>>>>>>> Stashed changes
      render :index, status: :unprocessable_entity
=======
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
>>>>>>> Stashed changes
    end
  end

  private

  def order_params
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
    params.require(:order).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(
      buyer_id: current_user.id, item_id: params[:item_id], token: params[:token]
=======
    params.require(:order).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(buyer_id: current_user.id, item_id: params[:item_id] ,token: params[:token])
=======
    params.require(:order).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(buyer_id: current_user.id, item_id: params[:item_id] ,token: params[:token])
  end

  def pay_item
    item = Item.find(order_params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: item.price,
      card: order_params[:token],
      currency:'jpy'
    )
>>>>>>> Stashed changes
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
>>>>>>> Stashed changes
    )
  end

<<<<<<< Updated upstream
  def set_order
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    return unless Record.exists?(item_id: @item.id) || current_user == @item.user

    redirect_to root_path
  end

=======
>>>>>>> Stashed changes
  def pay_item
    item = Item.find(order_params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
=======
    params.require(:order).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number, :record_id, :buyer_id, :item_id)
  end

end
>>>>>>> Stashed changes
