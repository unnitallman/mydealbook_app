class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # access control
  before_filter do |c|
    identifier = [c.class.to_s, c.action_name].join('#')
    deny_access unless present_user.can?(identifier) #acts_as_authoritah gem adds the can? method.
  end

  def after_sign_in_path_for(user)
    if user.admin?
      admin_dashboard_path
    elsif user.agent?
      agent_dashboard_path
    else
      root_path
    end 
  end

  def deny_access
    if user_signed_in?
      respond_to do |format|
        format.html { redirect_to access_denied_path }
        format.json {
          render nothing: true, status: 403
        }
        format.js {
         render nothing: true, status: 403
        }
      end
    else
      flash[:notice] = "Access denied. Please login"
      respond_to do |format|
        format.html { redirect_to new_user_session_path }
        format.json {
          render nothing: true, status: 401
        }
        format.js {
          render nothing: true, status: 401
        }
      end
    end
  end

end
