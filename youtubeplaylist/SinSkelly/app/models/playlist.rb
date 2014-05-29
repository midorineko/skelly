class Playlist < ActiveRecord::Base
  has_many :tracks
  has_many :viewedplaylists
  has_many :viewers, through: :viewedplaylists, source: :viewer
  belongs_to :user
end
