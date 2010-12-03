class UserSession < Authlogic::Session::Base
  login_field :email
  password_field :password
  def to_key
    self.keys.to_a
  end

end