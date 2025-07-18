class Task < ApplicationRecord
  enum :status, %i[in_progress completed overdue canceled], default: :in_progress
  ransacker :status, formatter: proc {|v| statuses[v]}

  ransacker :status, formatter: proc {|v| statuses[v]} do |parent|
    parent.table[:status]
  end

  ransacker :created_at do
    Arel.sql('date(tasks.created_at)')
  end


  def self.ransackable_attributes(auth_object = nil)
    %w[title description status due_date created_at]
  end
end
