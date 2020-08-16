class UserClearCodeJob < ApplicationJob
  queue_as :default

  def perform(user, time)
    # Do something later
    if time == user.restore_code_task_started
      user.skip_pass = true
      user.restore_code = nil
      user.save
    end
  end

end
