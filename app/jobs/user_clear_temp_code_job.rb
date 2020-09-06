class UserClearTempCodeJob < ApplicationJob
  queue_as :default

  def perform(user, time)

    if time.to_s == user.change_code_task_started.to_s

      user.skip_pass = true
      user.email_temp = nil
      user.email_temp_code = nil
      user.save

    end
  end
end
