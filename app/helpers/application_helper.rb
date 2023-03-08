module ApplicationHelper
  def get_active_class(controller, action)
    return "active" if controller_path == controller && action == action_name
    ""
  end
end
