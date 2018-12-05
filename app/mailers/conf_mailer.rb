class ConfMailer < ApplicationMailer
  default from: 'no-reply@university-tracker.com'

  def send_conf_email(user)
    @user = user
    @url = "https://mighty-island-43301.herokuapp.com/users/mail_auth?conf=#{@user.confirm_code}"
    mail(to: @user.email, subject: "Account Verification")
  end

  def weekly_email(user, tasks)
    @user = user
    @tasks = tasks
    mail(to: @user.email, subject: "University Tracker Weekly Update")
  end

  def reset_pass(user,code)
    @user = user
    @url = "https://mighty-island-43301.herokuapp.com/users/reset_password?code=#{code}"
    mail(to: @user.email, subject: "Reset Password")
  end
end
