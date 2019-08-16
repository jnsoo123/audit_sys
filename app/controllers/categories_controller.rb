class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = CategoryForm.new
  end

  def create
    @category = CategoryForm.new(category_params)

    if @category.persist
      redirect_to categories_path, notice: 'Category Created !!'
    else
      render :new
    end
  end

  def edit
    @category = CategoryForm.new(object: category)
  end
  
  def update
    @category = CategoryForm.new(category_params.merge(object: category))
    
    if @category.persist
      redirect_to categories_path, notice: 'Category Updated !!'
    else
      render :edit
    end
  end

  def show
    @category = category
  end

  def destroy
    @category = CategoryForm.new(object: category)

    if @category.destroy
      redirect_to categories_path, notice: 'Category Destroyed !!'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :color)
  end

  def category
    Category.find(params[:id]).decorate
  end
end
