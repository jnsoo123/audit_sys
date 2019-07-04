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

  def edit
    @item = ItemForm.new(item: item)
  end

  def update
    @item = ItemForm.new(item_params.merge(item: item))

    if @item.update
      redirect_to items_path, notice: 'Item Updated'
    else
      render :edit
    end
  end

  def destroy
    @item = ItemForm.new(item: item)

    if @item.destroy
      redirect_to items_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :date_purchased, :category_id, :specs)
  end

  def item
    Item.find(params[:id])
  end
end
