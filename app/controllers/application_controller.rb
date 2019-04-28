class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :current_cart

  protected

  def current_cart
    @current_cart ||= ShoppingCart.new(token: cart_token)
  end
  helper_method :current_cart

  def states
    @states ||= State.all
  end
  helper_method :states

  def cities(state_id)
    @cities ||= City.where(state_id: state_id)
  end
  helper_method :cities

  def locations(city_id)
    @locations ||= Location.where(city_id: city_id)
  end
  helper_method :locations

  private

  def cart_token
    return @cart_token unless @cart_token.nil?

    session[:cart_token] ||= SecureRandom.hex(8)
    @cart_token = session[:cart_token]
  end

end
