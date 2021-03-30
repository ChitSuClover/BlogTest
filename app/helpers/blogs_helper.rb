module BlogsHelper
  def choose_new_or_edit
    if action_name == 'new'
      confirm_blogs_path
    elsif action_name == 'edit'
      blogs_path
    end
  end
end
