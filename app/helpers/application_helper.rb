module ApplicationHelper

  def is_active_manage(manage_name)
    params[:controller].start_with?(manage_name) ? 'open' : nil
  end

  def is_active_controller(controller_name)
    params[:controller] == controller_name ? 'active' : nil
  end

  def is_active_action(controller_name,action)
    params[:controller] == controller_name && params[:action] == action ? "active" : nil
  end

  def format_time_yymmdd(time)
    time.strftime("%Y-%m-%d") if time.present?
  end

  def format_time_mmdd(time)
    time.strftime("%m月%d日") if time.present?
  end

  def format_time_yymmddhms(time)
    time.strftime("%Y-%m-%d %H:%M:%S") if time.present?
  end

  def format_time_yymmddhm(time)
    time.strftime("%Y-%m-%d %H:%M") if time.present?
  end

end
