class CategoriesController < ApplicationController
  before_filter :authenticate_user!, :except => [:some_action_without_auth]
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  respond_to :html
  if current_user.admin==true

  def index
    @categories = Category.all
    respond_with(@categories)
  end
end
  def show
    respond_with(@category)
  end

  def new
    @category = Category.new
    respond_with(@category)
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    @category.save
    respond_with(@category)
  end

  def update
    @category.update(category_params)
    respond_with(@category)
  end

  def destroy
    @category.destroy
    respond_with(@category)
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:item_id, :name, :category_type)
      #params.require(:item).permit(:name, :price, :user_id)
    end
end
