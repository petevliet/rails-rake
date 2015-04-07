task :argument_taker, [:name, :format] => [:environment] do |t, args|

  name = args[:name]
  file_format = args[:format]

  raise "Please use 'events' or 'products' for first argument." unless ((name != "events") || (name != "products"))
  raise "Please use 'csv' or 'json' for second argument." unless ((file_format != "csv") || (file_format != "json"))

  if file_format == "csv"
    @data = name.capitalize.singularize.constantize.all
    csv_string = CSV.generate do |csv|
      if name == "events"
        csv << ["topic", "date_time", "location","attendees", "notes"]
      else
        csv << ["name", "price", "color", "size"]
      end
      @data.each do |data|
        if name == "events"
          csv << [data.topic, data.date_time, data.location, data.attendees, data.notes]
        else
          csv << [data.name, data.price, data.color, data.size]
        end
      end
    end
    File.write 'data.csv', csv_string
  elsif file_format == "json"
    json_string = name.capitalize.singularize.constantize.all.to_json
    File.write 'data.json', json_string
  end
end
