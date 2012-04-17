class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :username, :type => String
  field :email, :type => String
  field :password_hash, :type => String
  field :password_salt, :type => String
  
  key :username
  
  attr_accessible :username, :email, :password, :password_confirmation

  attr_accessor :password
  before_save :encrypt_password  
  
  validates_confirmation_of :password
  validates_presence_of :username, :message => "Empty - Please enter a username"
  validates_uniqueness_of :username, :message => "already in use. Please select another."
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  
  def self.authenticate(username, password)
    user = find(username)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  
  
end
