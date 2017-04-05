class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @users_count = User.all.count
    @lodgings_count = Lodging.all.count
  end
end
