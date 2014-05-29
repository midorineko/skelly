class Viewedplaylist < ActiveRecord::Base
  belongs_to :playlist
  belongs_to :viewer, class_name: "User"
end

