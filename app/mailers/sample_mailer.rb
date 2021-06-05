class SampleMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sample_mailer.send_when_update.subject
  #
  def send_when_update(group_users, title, content)
    @title = title
    @content = content
    mail bcc: group_users.pluck(:email), subject: title
  end
end

