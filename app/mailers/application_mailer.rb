class ApplicationMailer < ActionMailer::Base
  default from:     "メールテスト運営局",
          bcc:      "sent@gmail.com",
          reply_to: "reply@gmail.com"
  layout 'mailer'
end
