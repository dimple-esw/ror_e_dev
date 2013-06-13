class WelcomeController < ApplicationController
 layout :layout_by_resource
  def index
  end
  private


  def layout_by_resource
    if current_user
      "site"
    else
      "application"
    end
  end


end
