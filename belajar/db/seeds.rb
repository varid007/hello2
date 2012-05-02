# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = User.create([{:first_name => "aku", :last_name => "farid", :email => "sadewa44@gmail.com", :username => "aku",  :age => 21, :birthday => 01-05-1990},
                     {:first_name => "sundel", :last_name => "yoyok", :email => "sadewa441@gmail.com", :username => "dia", :age => 21, :birthday => 01-05-1990},
                     {:first_name => "ari", :last_name => "ismunanto", :email => "sadewa442@gmail.com", :username => "mereka",:age => 21, :birthday => 01-05-1990},
                     {:first_name => "Dian", :last_name => "ria", :email => "sadewa443@gmail.com", :username => "bion", :age => 21, :birthday => 101-05-1990},
                     {:first_name => "poses", :last_name => "ngeh", :email => "sadewa444@gmail.com", :username => "botak", :address => "kami", :age => 21, :birthday => 05-04-1990}
                   ])

countries = Country.create([{:code => "JKT48", :name => "Jakarta"},
                            {:code => "BDG49", :name => "BANGKA"},
                            {:code => "PDG50", :name => "PADANG"},
                            {:code => "BL001", :name => "BALI"},
                            {:code => "AMB19", :name => "AMBON"}
                          ])

articles = Article.create([{:title => "Bandung 1", :body => "SATU"},
                           {:title => "Bandung 2", :body => "DUA"},
                           {:title => "Bandung 3", :body => "TIGA"},
                           {:title => "Bandung 4", :body => "EMPAT"},
                           {:title => "Bandung 5", :body => "LIMA"},
                         ])

comments = Comment.create([{:content => "HAI"},
                           {:content => "HAI"},
                           {:content => "HAI"},
                           {:content => "HAI"},
                           {:content => "HAI"},
                         ])
