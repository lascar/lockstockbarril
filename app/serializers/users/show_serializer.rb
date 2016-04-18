# user_serializer serialize one user
class Users::ShowSerializer < ActiveModel::Serializer
  root :user
  attributes :id, :name, :email
end
