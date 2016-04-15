# user_serializer serialize one user
class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
end
