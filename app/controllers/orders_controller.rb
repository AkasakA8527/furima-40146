class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @order_purchase = OrderPurchase.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_purchase = OrderPurchase.new(order_params)
    if @order_purchase.valid?
      @order_purchase.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_purchase).permit(:item_id, :postal_code, :prefecture_id,
                                         :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end

# 22 :price,
# pictweet comment_controller
# item_id:    
