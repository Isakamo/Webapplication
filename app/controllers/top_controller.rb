class TopController < ApplicationController
  def index
    #@tilte = 'THE 雑談'
    @boards = Board.all
    @newboards = Board.new
    #render template: 'top/index'
  end

  def show
    @boards = Board.find(params[:id])
    @newthres = Thre.new(:board_id => params[:id])
    @thres = Thre.where(board_id: params[:id])
  end

  def create
    #@boards = Board.new(params[:name].permit(:name))
    @boards = Board.new(params[:board].permit(:name))
    @boards.save
    redirect_to top_path
  end

  def delete
    @boards = Board.find(params[:id])
    @boards.destroy
    redirect_to top_path
  end
end
