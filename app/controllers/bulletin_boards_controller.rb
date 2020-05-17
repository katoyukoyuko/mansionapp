class BulletinBoardsController < ApplicationController
  before_action :set_bulletin_board, only: [:show]
  before_action :set_user, only: [:index]

  def index
    @bulletin_boards = BulletinBoard.all.order(created_at: :desc).page(params[:page]).per(2)
  end

  def new
    @bulletin_board = BulletinBoard.new
    @bulletin_board.user = current_user
  end

  def create
    @bulletin_board = current_user.bulletin_boards.build(bulletin_boards_params)
    if @bulletin_board.save
      redirect_to @bulletin_board, notice: '掲示板を作成しました'
    else
      render :new, notice: '保存できませんでした'
    end
  end

  def show; end

  private

  def bulletin_boards_params
    params.require(:bulletin_board).permit(:title, :content, :memo, :content_chace)
  end

  def set_bulletin_board
    @bulletin_board = BulletinBoard.find(params[:format])
  end

  def set_user
    @user = current_user
  end
end
