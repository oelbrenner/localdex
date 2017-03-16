module UsersHelper
  
  def user_status(user)
    if current_user == user || user.invitation_accepted?
      content_tag(:span, 'Active', class: 'checkmark')
    else
      'Invite Pending'
    end
  end
end
