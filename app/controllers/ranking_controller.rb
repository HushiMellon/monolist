class RankingController < ApplicationController
     before_action :set_item, only: [:show]
     
    def have
        have_ranking = Have.group(:item_id).order('count_item_id desc').limit(10).count(:item_id).keys
        @items = have_ranking.map {|id| Item.find(id) }
        @count = 0
    end
    
    def want
         want_ranking = Want.group(:item_id).order('count_item_id desc').limit(10).count(:item_id).keys
        @item = want_ranking.map {|id| Item.find(id) }
        @count = 0
    end
    
    
end
