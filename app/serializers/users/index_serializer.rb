# user_serializer serialize one user
class Users::IndexSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
end
