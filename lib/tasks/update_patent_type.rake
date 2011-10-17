desc "Updating Patent_type"
task :update_patent_type=> :environment do
  Patent.all.each do |u|
    u.patent_type="Patent" 
    u.save
  end
end
