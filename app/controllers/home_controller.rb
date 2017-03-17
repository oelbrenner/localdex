class HomeController < ApplicationController
  def index
    @users_count = User.all.count
    @lodgings_count = Lodging.all.count
  end
end
