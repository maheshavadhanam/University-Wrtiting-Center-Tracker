class WeeklyEmails < ActiveJob::Base
  def perform
    users = Users.all
    users.each do |user|
      tasks = user.tasks.all
      if tasks
        ConfMailer.weekly_email(user,tasks).deliver_now
      end
    end
  end
end
