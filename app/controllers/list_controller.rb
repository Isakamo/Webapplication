class ListController < ApplicationController
  def create
    @thre = (params[:thre].permit(:board_id, :name, :user))
    @thre.save
    redirect_to top_show_path(params[:thre]['board_id'])
  end
end
