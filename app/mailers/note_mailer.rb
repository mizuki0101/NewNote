class NoteMailer < ApplicationMailer
  def send_when_update(user)
    @user = user
    mail to:      @user.email,
         subject: '会員情報が更新されました。'
  end
end
