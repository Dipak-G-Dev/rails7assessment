class HomepagesController < ApplicationController
  def home
    @user=current_user.id
  end
end
