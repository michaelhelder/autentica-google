class OmniauthController < ApplicationController

  def facebook
      @user = User.create_from_provider_data(request.env['omniauth.auth'])
      if @user.persisted?
          sign_in_and_redirect @user
          set_flash_messege(:notice, :success, kind: 'Facebook') if is_navigational_format?
      else
          redirect_to new_user_registration_url
      end
  end

  def github
      @user = User.create_from_provider_data(request.env['omniauth.auth'])
      if @user.persisted?
          sign_in_and_redirect @user
          set_flash_messege(:notice, :success, kind: 'Github') if is_navigational_format?
      else
          redirect_to new_user_registration_url
      end
  end

  def google_oauth2
        @user = User.create_from_provider_data(request.env['omniauth.auth'])
        if @user.persisted?
            sign_in_and_redirect @user
            set_flash_messege(:notice, :success, kind: 'Google') if is_navigational_format?
        else
            redirect_to new_user_registration_url
        end
    end

    def failure
      redirect_to new_user_registration_url, notice: "Erro na autenticação com o Google."
    end
end
