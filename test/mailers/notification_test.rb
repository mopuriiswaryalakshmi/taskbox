require 'test_helper'

class NotificationTest < ActionMailer::TestCase
  test "task_complete" do
    mail = Notification.task_complete
    assert_equal "Task complete", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
