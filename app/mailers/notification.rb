class Notification < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.task_completed.subject
  #
  def task_complete(task)
    @task = task
    mail to: "#{task.project.client.email}", subject: "#{task.title} has been completed"
end


def announcement(announcement)
	@announcement = announcement
	mail to: "#{announcement.user.clients.pluck(:email).join(',')}", subject: "#{announcement.title}"
end

end


#def task_reopened(task)
#	@task = task
#	mail_to: "#{task.project.client.email}", subject: "#{task.title} has been reopened"
 #end



