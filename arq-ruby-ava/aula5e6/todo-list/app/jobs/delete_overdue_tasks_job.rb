class DeleteOverdueTasksJob < ApplicationJob
  queue_as :background

  def perform
    Task.where("due_date < ?", Date.today).in_batches do |tasks|
      tasks.update_all(status: :canceled)
    end
  end
end