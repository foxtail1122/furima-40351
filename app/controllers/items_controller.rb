class ItemsController < ApplicationController
  # before_action :set_item, only: [:show]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
    return if user_signed_in?

    redirect_to new_user_session_path
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:title, :image, :introduction, :category_id, :condition_id, :fee_id, :place_id, :price,
                                 :day_id).merge(user_id: current_user.id)
  end

  # def set_item
  # @item = Item.find(params[:id])
  # end
end
