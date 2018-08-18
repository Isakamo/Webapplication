class ListController < ApplicationController
  def create
    @thres = Thre.new(params[:thre].permit(:id, :name, :user_id, :board_id, :is_delete))
    if user_signed_in? == true then
      @thres.user_id = current_user.id
    else
      @thres.user_id = ""
    end

    if @thres.is_delete == nil then
      @thres.is_delete = false
    end
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

  def delete
    @thres = Thre.find(params[:id])
    @thres.destroy
    #redirect_to action: :show, id:thre_id
    redirect_to top_show_path(id: @thres.board_id)
  end

  def create_res
    @responses = Response.new(params[:response].permit(:id, :thre_id, :content, :user_id, :user_name, :is_delete, :response_id, :up_file_id))
    if user_signed_in? == true && @responses.user_name == "" then
      @responses.user_id = current_user.id
      @responses.user_name = current_user.name
    elsif user_signed_in? == true then
      @responses.user_id = current_user.id
    elsif @responses.user_name == nil then
      @responses.user_id = ""
      @responses.user_name = "匿名"
    end

    if @responses.is_delete == nil then
      @responses.is_delete = false
    end
    is_saved = @responses.save
    redirect_to list_show_path(params[:response]['thre_id'])
  end

  def delete_res
    @responses = Response.find(params[:id])
    @responses.destroy
    #redirect_to action: :show, id:thre_id
    redirect_to list_show_path(id: @responses.thre_id)
    #redirect_to list_show_path
  end
end
