class UserController < ApplicationController

  def create
    User.create(user_params)
<<<<<<< HEAD
    render json: "user created"
=======
    render json: "user created", status: 200
>>>>>>> parent of b484e79... Merge branch 'development' of github.com:Guy-Norkunas/roastme-server into guy
  end

  def show
    user = User.find(params[:id])
    render json: {posts: user.posts, recipes: user.recipes}
    
  end
  private 
<<<<<<< HEAD
=======
  
>>>>>>> parent of b484e79... Merge branch 'development' of github.com:Guy-Norkunas/roastme-server into guy
  def user_params 
    params.require(:user).permit(:email, :password, :username)
  end 
end
