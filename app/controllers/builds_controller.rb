class BuildsController < ApplicationController
  before_action :set_build, only: [:edit, :update, :destroy]

  def index
    @q      = Build.ransack(params[:q])
    @builds = @q.result
  end

  def new
    @build = BuildForm.new
    @items = Item.all.map { |item| [item.id, item.name] }
  end

  def create
    @build = BuildForm.new(build_params)
    if @build.persist
      redirect_to builds_path, notice: 'Build Created !!'
    end
  end

  def edit
    @build_form = BuildForm.new(object: @build)
  end

  def update
    @build_form = BuildForm.new(build_params.merge(object: @build))

    if @build_form.persist
      redirect_to builds_path, notice: 'Build Updated !!'
    end
  end

  def destroy
    @build_form = BuildForm.new(object: @build)

    if @build_form.destroy
      redirect_to builds_path, notice: 'Build Deleted !!'
    end
  end

  private

  def set_build
    @build = Build.find(params[:id])
  end

  def build_params
    params.require(:build).permit(:name)
  end
end
