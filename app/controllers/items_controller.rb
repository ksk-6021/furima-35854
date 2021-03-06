class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :item_info, only: [:show, :edit, :update, :destroy]
  before_action :user_verification, only: [:edit, :update, :destroy]
  before_action :purchase_history, only: [:edit, :update]
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :explain, :category_id, :condition_id, :shipping_charge_id, :shipping_area_id,
                                 :shipping_time_id, :price, :image).merge(user_id: current_user.id)
  end

  def item_info
    @item = Item.find(params[:id])
  end

  def user_verification
    redirect_to action: :index unless @item.user == current_user
  end

  def purchase_history
    redirect_to root_path if @item.order.present?
  end
end
