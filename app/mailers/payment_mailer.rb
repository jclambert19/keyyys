class PaymentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.payment_mailer.creation_confirmation.subject
  #
  def creation_confirmation(user)
    @user = user

    mail to: @user.email, subject: "Validation de votre paiement Keyyys"
  end
end
