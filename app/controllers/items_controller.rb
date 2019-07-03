class ItemsController < ApplicationController
  def index
    @q     = Item.includes(:category).ransack(params[:q])
    @items = @q.result
  end

  def new
    @item       = ItemForm.new
    @categories = Category.all
  end

  def create
    @item = ItemForm.new(item_params)

    if @item.save
      redirect_to root_path, notice: 'Item Created !!'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :date_purchased, :category_id, :specs)
  end
end
