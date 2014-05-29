class User < ActiveRecord::Base
  has_many :viewedplaylists, foreign_key: "viewer_id"
  # has_many :created_playlists, through: :viewedplaylists, source: :playlist
  has_many :watched_playlists, through: :viewedplaylists, source: :playlist
  has_many :playlists

  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :save
  validates :password, presence: true


  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.new(password_hash)
  end

   def password=(pass)
    @entered_password = pass
    @password = Password.create(pass)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    creator = Creator.find_by_email(email)
    return creator if creator && (creator.password == password)
    nil # either invalid email or wrong password
  end


end
