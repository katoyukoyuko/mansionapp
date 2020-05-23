class QuestionnairesController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.role != "user"
    @question1 = [[t('enum.questonnaire.question1.verygood'), Questionnaire.where(question1: 0).count],
    [t('enum.questonnaire.question1.good'), Questionnaire.where(question1: 1).count],
    [t('enum.questonnaire.question1.neutral'), Questionnaire.where(question1: 2).count],
    [t('enum.questonnaire.question1.bad'), Questionnaire.where(question1: 3).count],
    [t('enum.questonnaire.question1.verybad'), Questionnaire.where(question1: 4).count]]
    @question2 = [[t('enum.questonnaire.question2.highrecommend'), Questionnaire.where(question2: 0).count],
    [t('enum.questonnaire.question2.recommend'), Questionnaire.where(question2: 1).count],
    [t('enum.questonnaire.question2.soso'), Questionnaire.where(question2: 2).count],
    [t('enum.questonnaire.question2.not'), Questionnaire.where(question2: 3).count],
    [t('enum.questonnaire.question2.verynot'), Questionnaire.where(question2: 4).count]]
    @question3 = [[t('enum.questonnaire.question3.select1'), Questionnaire.where(question3: 0).count],
    [t('enum.questonnaire.question3.select2'), Questionnaire.where(question3: 1).count],
    [t('enum.questonnaire.question3.select3'), Questionnaire.where(question3: 2).count],
    [t('enum.questonnaire.question3.select4'), Questionnaire.where(question3: 3).count],
    [t('enum.questonnaire.question3.select5'), Questionnaire.where(question3: 4).count]]
    else
      redirect_to user_path, notice: 'アンケート結果は理事長、管理人のみ閲覧できます'
    end
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

  # 今後編集機能を検討する可能性があるので一旦以下の記述そのまま残しています
  # def edit; end

  # def update
  #   if @questionnaire.update
  #     redirect_to user_path, notice: 'アンケート回答内容の変更ができました'
  #   else
  #     render :edit, notice: 'アンケート回答内容の編集できませんでした'
  #   end
  # end

  private
  def questionnaire_params
    params.require(:questionnaire).permit(:question1, :question2, :question3, :user_id)
  end

  def set_questionnaire
    @questionnaire = Questionnaire.find(params[:id])
  end
end
