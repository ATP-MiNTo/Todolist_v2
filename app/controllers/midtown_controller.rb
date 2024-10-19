class MidtownController < ApplicationController
    def home
        @catego = Catego.find_by(id: params[:catego_id]) if params[:catego_id].present?
        
        # Fetch tasks based on the selected category
        @tasks = if @catego.present?
                   Task.where(catego_id: @catego.id)
                 else
                   Task.all
                 end
      end
      

end
