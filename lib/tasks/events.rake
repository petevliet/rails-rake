require 'csv'

task event_exporter: :environment do
  @events = Event.all
    csv_string = CSV.generate do |csv|
         csv << ["topic", "date_time", "location","attendees", "notes"]
         @events.each do |event|
           csv << [event.topic, event.date_time, event.location, event.attendees, event.notes]
         end
    end
    File.write 'events.csv', csv_string
end
