require 'json'

task product_exporter: :environment do
  json_string = Product.all.to_json
    File.write 'products.json', json_string
end
