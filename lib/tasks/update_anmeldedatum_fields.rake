desc "Updating Anmeldedatum_fields"
task :update_anmeldedatum_fields=> :environment do
  Patent.where('anmeldedatum is not null').each do |u|
    u.anmeldedatum_month = u.anmeldedatum.month
    u.anmeldedatum_day = u.anmeldedatum.day
    u.save
  end
end
