class ItemsController < ApplicationController
  before_action :logged_in_user , except: [:show]
  before_action :set_item, only: [:show]

  def new
    
    @items_name = params[:q]
     if @items_name.present?
      Amazon::Ecs.debug = true
      response = Amazon::Ecs.item_search(@items_name, 
                                  :search_index => 'All' , 
                                  :response_group => 'Medium' , 
                                  :country => 'jp')
      @amazon_items = response.items
     end
      
  end

  def show
    
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
end
