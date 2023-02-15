class UsersController < ApplicationController

  def index
    matching_users = User.all
    @users = matching_users.order(:created_at)

    render({ :template => "user_templates/all_users.html.erb"})
  end
  
  def show
    username = params.fetch("username")
    matching_users = User.where({ :username => username })
    @user = matching_users.at(0)

    render({ :template => "user_templates/user_details.html.erb"})
  end
  
  def create
    query_username = params.fetch("query_username")
    
    user = User.new
    user.username = query_username
    user.save
    
    redirect_to("/users/#{user.username}")
  end
  



  def update
    
    user_id = params.fetch("modify_user")
    matching_users = User.where({ :id => user_id })
    the_user = matching_users.at(0)
    
    new_username = params.fetch("query_username")

    the_user.username = new_username
    the_user.save
    
    redirect_to("/users/"+the_user.username.to_s)
  end

end
