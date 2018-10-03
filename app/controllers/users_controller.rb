class UsersController < ApplicationController

  def index

    render json: User.all

  end

  private

  def user_params
    # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
    # that can be submitted by a form to the user model #=> require(:user)
    params.require(:user).permit(:rfc, :password, :password_digest)
  end

end