class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    user = User.from_google(params)

    if user.present?
      sign_out_all_scopes
      flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect user, event: :authentication
    else
      flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."
    end
  end

  private

  def params
    @params ||= {
      uid: auth.uid,
      email: auth.info.email,
      provider: auth.provider
    }
  end

  def auth
    @auth ||= request.env['omniauth.auth']
  end
end