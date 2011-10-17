# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111017164712) do

  create_table "admins", :force => true do |t|
    t.string    "login",                     :limit => 40
    t.string    "name",                      :limit => 100, :default => ""
    t.string    "email",                     :limit => 100
    t.string    "crypted_password",          :limit => 40
    t.string    "salt",                      :limit => 40
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "remember_token",            :limit => 40
    t.timestamp "remember_token_expires_at"
  end

  add_index "admins", ["login"], :name => "index_admins_on_login", :unique => true

  create_table "applications", :force => true do |t|
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "bills", :force => true do |t|
    t.date      "datum"
    t.string    "rechnungsnummer"
    t.integer   "patent_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "user_id"
    t.date      "rechnungsdatum"
  end

  create_table "fees", :force => true do |t|
    t.integer   "year_1"
    t.integer   "year_2"
    t.integer   "year_3"
    t.integer   "year_4"
    t.integer   "year_5"
    t.integer   "year_6"
    t.integer   "year_7"
    t.integer   "year_8"
    t.integer   "year_9"
    t.integer   "year_10"
    t.integer   "year_11"
    t.integer   "year_12"
    t.integer   "year_13"
    t.integer   "year_14"
    t.integer   "year_15"
    t.integer   "year_16"
    t.integer   "year_17"
    t.integer   "year_18"
    t.integer   "year_19"
    t.integer   "year_20"
    t.string    "country"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "inventions", :force => true do |t|
    t.integer   "patent_id"
    t.integer   "inventor_id"
    t.integer   "patent_invention_id"
    t.integer   "user_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "patent_protocols", :force => true do |t|
    t.date      "time"
    t.string    "comment"
    t.integer   "patent_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "patents", :force => true do |t|
    t.text      "zusammenfassung"
    t.date      "anmeldedatum"
    t.boolean   "lizenzbereitschaft"
    t.date      "veröffentlichungsdatum"
    t.integer   "status"
    t.date      "prioritätsfrist"
    t.date      "prüfungsantragsfrist"
    t.boolean   "priorität"
    t.string    "nationalität"
    t.string    "amtlaktenzeichen"
    t.string    "internaktenzeichen"
    t.date      "verspätungsgebühr"
    t.date      "rechtsverlust"
    t.date      "überwachungsanfrage"
    t.date      "ersteerinnerung"
    t.date      "zweiteerinnerung"
    t.date      "gebührenfälligkeit"
    t.string    "rechteübergangErfinder"
    t.string    "titel"
    t.string    "ihrzeichen"
    t.boolean   "bezahlt"
    t.integer   "zustand"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.boolean   "rechnung_bezahlt"
    t.integer   "anmeldedatum_day"
    t.integer   "anmeldedatum_month"
    t.string    "patent_type"
  end

  create_table "procurations", :force => true do |t|
    t.integer   "procurator_id"
    t.integer   "patent_procuration_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "patent_id"
    t.integer   "user_id"
  end

  create_table "submissions", :force => true do |t|
    t.integer   "submitter_id"
    t.integer   "patent_id"
    t.integer   "user_id"
    t.integer   "patent_submission_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.float     "anteil"
  end

  create_table "users", :force => true do |t|
    t.text      "name"
    t.text      "straße"
    t.text      "email"
    t.text      "plz"
    t.text      "telefon"
    t.text      "fax"
    t.text      "position"
    t.text      "typ"
    t.integer   "ansprechpartner"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "ansprechpartner_id"
    t.text      "anschrift"
  end

end
