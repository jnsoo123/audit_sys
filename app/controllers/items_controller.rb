class ItemsController < ApplicationController
  def index
    @q     = Item.includes(:category, :build).ransack(params[:q])
    @items = @q.result.decorate
  end

  def new
    @item       = ItemForm.new
    @categories = Category.all
    @builds     = Build.all
  end

  def create
    @item = ItemForm.new(item_params)

    if @item.save
      redirect_to root_path, notice: 'Item Created !!'
    end
  end

  def edit
    @item       = ItemForm.new(item: item)
    @categories = Category.all
    @builds     = Build.all
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
    params.require(:item)
      .permit(:name, :date_purchased, :category_id, :specs, :build_id)
  end

  def item
    Item.find(params[:id])
  end
end
