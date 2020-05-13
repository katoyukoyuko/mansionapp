class BulletinBoardsController < ApplicationController
  before_action :set_bulletin_board, only: [:show]

  def index
    @bulletin_boards = BulletinBoard.all
    @user = current_user
  end

  def show; end

  private

  def bulletin_boards_params
    params.require(:bulletin_board).permit(:title, :content, :memo, :content_chace)
  end

  def set_bulletin_board
    @bulletin_board = BulletinBoard.find(params[:format])
  end
end
