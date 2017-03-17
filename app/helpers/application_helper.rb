module ApplicationHelper
  
   def active_nav_class(link_path)
     current_page?(link_path) ? "nav-item active" : "nav-item"
   end

end
