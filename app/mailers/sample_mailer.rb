class SampleMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sample_mailer.send_when_update.subject
  #
  default to: -> {@group.group_users.user.pluck(:email) }
  def send_when_update(event)
    @event = event
    @group = Group.find(params[:group_id])


    mail to:      @group.group_users.user.email,
         subject: 'イベントが作成されました。'
  end
end
