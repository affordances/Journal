class User < ApplicationRecord
  include Authenticate::User
end
