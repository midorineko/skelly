class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.belongs_to :artist
      t.belongs_to :genre
    end
  end
end
