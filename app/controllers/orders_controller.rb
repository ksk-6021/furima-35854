class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :itemid_info, only: [:index, :create]
  before_action :user_verification, only: [:index, :create]
  
  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(
      token: params[:token], user_id: current_user.id, item_id: @item.id
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def itemid_info
    @item = Item.find(params[:item_id])
  end

  def user_verification
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    end
  end

end

