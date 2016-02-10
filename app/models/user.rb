# for devise + can self regulate
class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :identifier, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :access_token, uniqueness: true

  before_save :set_identifier
  before_create :generate_authentication_token!

  def generate_authentication_token!
    begin
      self.access_token = "#{self.email}:#{Devise.friendly_token}"
    end while self.class.exists?(access_token: access_token)
  end

  private
  def set_identifier
    return if identifier
    max_identifier = User.maximum(:identifier)
    self.identifier = max_identifier ? max_identifier + 1 : 11
  end

end
