class Notifier < ActionMailer::Base
  default from: "test@feki.de"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.welcome.subject
  #
  def welcome(recipient)
    @user = recipient
    @product = Product.first
    mail(:to => recipient.email, :subject => "Welcome to your shop")
  end

end
