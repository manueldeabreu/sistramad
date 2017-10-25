class AddStatusToWorkflowSteps < ActiveRecord::Migration[5.1]
  def change
    add_column :workflow_steps, :status, :string
  end
end
