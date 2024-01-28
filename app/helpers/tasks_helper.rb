module TasksHelper
  def priority_style(task)
    case task.priority
    when 'high'
      'bg-red-200 text-red-800'
    when 'medium'
      'bg-yellow-200 text-yellow-800'
    else
      'bg-gray-200 text-gray-800'
    end
  end
end
