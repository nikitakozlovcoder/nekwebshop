class AddRestoreCodeTaskStartedToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :restore_code_task_started, :datetime
  end
end
