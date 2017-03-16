namespace :db do
  desc "load lodgings from CSV"
  task :load_lodgings => :environment do
    require 'csv'    
    csv_text = File.read('db/import_data/lodgings.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      # puts row.to_hash.except(nil)
      Lodging.create!(row.to_hash.except(nil))
      print "."
    end
  end
end
