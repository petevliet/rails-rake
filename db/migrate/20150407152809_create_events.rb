class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :topic
      t.datetime :date_time
      t.string :location
      t.integer :attendees
      t.string :notes
    end
  end
end
