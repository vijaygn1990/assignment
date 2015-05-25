
require 'pry'
class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
   
    @items = Item.all
    respond_with(@items)
  end

  def show
    respond_with(@item)
  end

  def new
    @item = Item.new
    @categories = @item.categories.new
    respond_with(@item)
  end

  def edit
  end

  def create
   #binding.pry
    @item = Item.new(item_params)
    @item.user_id = current_user.email
    @item.save
    respond_with(@item)
  end

  def update
    @item.update( params[:item])
    respond_with(@item)
  end

  def destroy
    @item.destroy
    respond_with(@item)
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :price, :user_id)
    end
end
