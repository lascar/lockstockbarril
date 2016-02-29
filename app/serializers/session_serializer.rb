# session_serializer serialize the session
class SessionSerializer < ActiveModel::Serializer

  attributes :email, :token_type, :user_id, :access_token, :to_promote

  def user_id
    object.id
  end

  def token_type
    'Bearer'
  end
 
  def to_promote
    'promote'
  end
end
