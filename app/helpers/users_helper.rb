module UsersHelper
  def flash_class(level)
    if level == "notice"
      "alert alert-warning"
    elsif level == "success"
      "alert alert-success"
    elsif level == "error"
      "alert alert-danger"
    end
  end
end
