class UserMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    @url = 'http://localhost:3000/'
    mail(
      to: @user.email,
      subject: I18n.t('email.welcome')
    )
  end
end
