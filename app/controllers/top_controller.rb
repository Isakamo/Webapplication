class TopController < ApplicationController
  def index
    #@tilte = 'THE 雑談'
    @boards = Board.all
    @newboards = Board.new
    @users = User.all
    #render template: 'top/index'
  end

  def show
    @boards = Board.find(params[:id])
    @newthres = Thre.new(:board_id => params[:id])
    @thres = Thre.where(board_id: params[:id])
  end

  def edit
    @newBoards = Board.new
  end

  def create
    #@boards = Board.new
    @boards = Board.new(params[:board].permit(:id, :user_id, :name, :is_delete))
    @boards.user_id = current_user.id
    if @boards.is_delete == nil
      @boards.is_delete = false
    end
    is_saved = @boards.save
    redirect_to top_path

  end

  def delete
    @boards = Board.find(params[:id])
    @boards.destroy
    redirect_to top_path
  end
end
