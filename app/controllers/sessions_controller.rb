class SessionsController < ApplicationController

  layout "login"

  def new

    render :layout => 'login'

    # No need for anything in here, we are just going to render our
    # new.html.erb AKA the login page
  end

  def create
    user = User.find_by(rfc: params[:rfc].upcase) # params[:login][:rfc]

    # de inicio, generar el digest si no lo tiene
    if !user.passwd.blank? && user.password_digest.blank?
      pass_digest =  BCrypt::Password.create(user.passwd)
      user.password_digest = pass_digest
      user.save
    end

    # Verify user exists in db and run has_secure_password's .authenticate()
    # method to see if the password submitted on the login form was correct:
    if user && user.authenticate(params[:password])
      # Save the user.rfc in that user's session cookie:
      session[:user_rfc] = user.rfc
      redirect_to root_path
    else
      # if email or password incorrect, re-render login page:
      # flash.now.alert = "RFC o clabe incorrectos; intente de nuevo."
      # render :new
      redirect_to login_path, notice:  "RFC o clave incorrectos\n "
    end
  end

  def destroy
    # delete the saved user_id key/value from the cookie:
    session.delete(:rfc)
    redirect_to login_path, notice: "Sesión cerrada"
  end
end

=begin
  rails c
  pass =  BCrypt::Password.create('Verb1tim')
  => "$2a$10$.eFta7QufmVZpkt6jWz3fu4eXPeCC.E2uPJ8e20TitXFv7pw6wPqG"
=end