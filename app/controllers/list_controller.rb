class ListController < ApplicationController
  def create
    @thres = Thre.new(params[:thre].permit(:board_id, :name, :user))
    @thres.save
    redirect_to top_show_path(params[:thre]['board_id'])
  end

  def show
    @boards = Board.find(params[:id])
    @thres = Thre.where(board_id: params[:id])
    @responses = Response.where(thre_id: params[:id])
    @newresponses = Response.new(:thre_id => params[:id])
  end
end
