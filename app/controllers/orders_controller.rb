class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_sold_out, only: [:index, :create]
  before_action :check_seller, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_purchase = OrderPurchase.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_purchase = OrderPurchase.new(order_params)
    if @order_purchase.valid?
      pay_item
      @order_purchase.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def check_sold_out
    @item = Item.find(params[:item_id])
    return unless @item.order.present?

    redirect_to root_path
  end

  def check_seller
    @item = Item.find(params[:item_id])
    return unless @item.user_id == current_user.id

    redirect_to root_path
  end

  def order_params
    params.require(:order_purchase).permit(:item_id, :price, :postal_code, :prefecture_id,
                                           :city, :house_number, :building_name, :phone_number)
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
