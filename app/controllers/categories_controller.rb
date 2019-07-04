class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = CategoryForm.new
  end

  def create
    @category = CategoryForm.new(category_params)

    if @category.save
      redirect_to categories_path, notice: 'Category Created !!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :color)
  end
end
