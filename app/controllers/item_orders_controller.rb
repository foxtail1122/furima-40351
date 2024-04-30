class ItemOrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchased_item, only: [:index, :create]

  def index
    @item_order_form = ItemOrderForm.new
  end

  def create
    @item_order_form = ItemOrderForm.new(item_order_params)
    if @item_order_form.valid?
      pay_item
      @item_order_form.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def item_order_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end

  def item_order_params
    params.require(:item_order_form).permit(:postal_code, :prefecture_id, :city, :adress, :building_name, :phone_number).merge(user_id: current_user.id, item_id:params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,        # 商品の値段
      card: item_order_params[:token], # カードトークン
      currency: 'jpy'             # 通貨の種類（日本円）
    )
  end

  def non_purchased_item
    # itemがあっての、order_form（入れ子構造）。他のコントローラーで生成されたitemを使うにはcreateアクションに定義する。
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.item_order.present?
  end
end
