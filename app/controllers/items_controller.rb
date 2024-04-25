class ItemsController < ApplicationController
  

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  private
  def item_params
    params.require(:item).permit(:title, :image, :introduction, :category_id, :condition_id, :fee_id, :place_id, :price, :day_id).merge(user_id: current_user.id)
  end
end
