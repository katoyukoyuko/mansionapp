class BulletinBoardMailer < ApplicationMailer
  def bulletin_board_mail(bulletinboard, email)
    @bulletin_board = bulletinboard
    @email = email
    mail to: email, subject: I18n.t('views.bulletenboard.mailtitle')
  end
end