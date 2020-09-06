class AddChangeCodeTaskStartedToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :change_code_task_started, :datetime
  end
end
