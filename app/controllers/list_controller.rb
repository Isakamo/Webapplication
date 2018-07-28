class ListController < ApplicationController
  def create
    @thres = Thre.new(params[:thre].permit(:id, :name, :user_id, :board_id, :is_delete))
    @thres.save
    redirect_to top_show_path(params[:thre]['board_id'])
  end

  def show
    #@boards = Board.find(params[:id])
    @thres = Thre.find(params[:id])
    #@thres = Thre.where(board_id: params[:id])
    @newresponses = Response.new(:thre_id => params[:id])
    @responses = Response.where(thre_id: params[:id])
  end

  def create_res
    @responses = Response.new(params[:response].permit(:id, :thre_id, :content, :user_id, :is_delete, :response_id, :up_file_id))
    is_saved = @responses.save
    if is_saved == false then
      @responses.errors.full_messages
      #logger.debug(@boards.inspect)
    end
    redirect_to list_show_path(params[:response]['thre_id'])
  end
end
