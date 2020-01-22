# Preview all emails at http://localhost:3000/rails/mailers/note_mailer
class NoteMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/note_mailer/send_when_update
  def send_when_update
    NoteMailer.send_when_update
  end

end
