class UserMailer < ApplicationMailer

  def welcome(user)
    @user = user

    mail to: @user.email, subject: "Bienvenue chez Keyyys #{@user.first_name}"
  end
end
