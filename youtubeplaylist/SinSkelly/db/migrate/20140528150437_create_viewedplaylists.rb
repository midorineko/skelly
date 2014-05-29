class CreateViewedplaylists < ActiveRecord::Migration
  def change
    create_table :viewedplaylists do |t|
      t.belongs_to :viewer
      t.belongs_to :playlist
    end
  end
end
