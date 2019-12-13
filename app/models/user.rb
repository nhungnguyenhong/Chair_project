class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2, :facebook]
  
  # before_save :downcase_email
  
  enum role: [:user, :admin]
  
  # VALID_DATE_REGEX = /[0-3]{1}[0-9]{1}\/[0-1]{1}[0-9]{1}\/[1-2]{1}[0-9]{3}/
  # VALID_DATE_REGEX = /[1-2]{1}[0-9]{3}\/[0-1]{1}[0-9]{1}\/[0-3]{1}[0-9]{1}/
  # validates :birthday, format: { with: VALID_DATE_REGEX}
  validates :gender, inclusion: {in: ["male", "female"]}, allow_nil: true
  validates :role, inclusion: {in: ["user", "admin"]}

  # validates :nickname,  presence: true, length: {maximum: 30}
  
  after_initialize :set_default_role, :if => :new_record?
  #recommend_history
  has_many :recommend_histories
  
  mount_uploader :img, ImageUploader
  def set_default_role
    self.role ||= :user
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    unless user
      user = User.create(
        name: data['name'],
        email: data['email'],
        password: Devise.friendly_token[0,20],
        role: :user,
        nickname: data['name'],
        remote_img_url: data['image']
      )
    end
    user
end

  private
  def downcase_email
    self.email = email.downcase
  end
end
