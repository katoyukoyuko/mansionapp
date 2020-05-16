class QuestionnairesController < ApplicationController
  before_action :set_set_questionnaire, only: [:edit, :update]

  def index
    @questionnaires = Questionnaire.all
  end

  def new
    if Questionnaire.where(user: current_user).blank? && current_user.role != "apartment_manager"
      @questionnaire = Questionnaire.new
      @questionnaire.user = current_user
    elsif current_user.role == "apartment_manager"
      redirect_to user_path, notice: 'アンケートは住民の方のみ回答できます'
    else
      redirect_to user_path, notice: 'アンケートはすでに回答済みです'
    end
  end

  def create
    @questionnaire = current_user.build_questionnaire(questionnaire_params)
    if @questionnaire.save
      redirect_to user_path, notice: 'アンケート回答が完了しました'
    else
      render :new, notice: 'アンケート回答できませんでした'
    end
  end

  def edit; end

  def update
    if @questionnaire.update
      redirect_to user_path, notice: 'アンケート回答内容の変更ができました'
    else
      render :edit, notice: 'アンケート回答内容の編集できませんでした'
    end
  end

  private
  def questionnaire_params
    params.require(:questionnaire).permit(:question1, :question2, :question3, :user_id)
  end

  def set_questionnaire
    @questionnaire = Questionnaire.find(params[:id])
  end
end
