# frozen_string_literal: true

class Customers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  def google_oauth2
    callback_for(:google)
  end

  def facebook
    callback_for(:facebook)
  end

  def twitter
    callback_for(:twitter)
  end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback

  def callback_for(provider)
    @omniauth = request.env['omniauth.auth']
    info = Customer.find_oauth(@omniauth)
    @customer = info[:customer]
    if @customer.persisted?
      sign_in_and_redirect @customer, event: :authentication
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else
      @sns = info[:sns]
      render template: "customers/registrations/new"
    end
  end

  def failure
    redirect_to(root_path) && return
  end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
