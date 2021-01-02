class CategorysController < ApplicationController
  def index
    @categorys = Category.where(id: 2..10)
  end

  def show
    @category = Category.find(params[:id])
    @category_items = Item.where(category_id: params[:id])
  end
end
