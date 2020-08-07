class UsersController < Devise::UsersController
  protected

  # def after_admin_destroy_user_path_for(resource)
  #   root_path
  # end
  
  # def destroy
  #   @user = User.find(params[:id])
  #   @user.destroy

  #   if @user.destroy
  #       redirect_to root_url, notice: "User deleted."
  #   end
  # end
end