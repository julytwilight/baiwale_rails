class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation, :old_password,
                  :remember_token, :last_login, :location, :gender, :avatar
  has_secure_password
  has_many :topics, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" },
                             :default_url => "/assets/avatar.png",
                             :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
                             :url => "/system/:attachment/:id/:style/:filename",
                             :convert_options => { :all => "-quality 80" }

  before_save { |user| user.email = email.downcase }

  validates :username, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }, on: :create
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false },
                    on: :create
  validates :password, length: { minimum: 6 }, on: :create

  #保存用户信息
  def update_user_info(info)
    if !info['username'].empty?
      self.username = info[:username]
    end
    self.gender = info[:gender]
    self.localtion = info[:localtion]
    self.save
  end

end