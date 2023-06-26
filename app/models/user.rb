class User < ApplicationRecord
  has_many :readmes
  devise  :database_authenticatable, :registerable,
    :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
    
end
