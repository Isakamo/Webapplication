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

  def create
    #@boards = Board.new(params[:name].permit(:name))
    @boards = Board.new(params[:board].permit(:id, :user_id, :name, :is_delete))
    is_saved = @boards.save

    if is_saved == false then
      #user.errors.full_messages
      logger.debug(@boards.inspect)
    end
    redirect_to top_path

  end

  def delete
    @boards = Board.find(params[:id])
    @boards.destroy
    redirect_to top_path
  end
end
