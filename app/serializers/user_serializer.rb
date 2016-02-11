# user_serializer serialize one user
class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :created_at, :updated_at, :access_token
end
