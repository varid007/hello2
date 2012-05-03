# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

countries = Countrie.create([{:code => "JKT1", :name => "Jakarta"},
                            {:code => "JKT2", :name => "Bandung"},
                            {:code => "JKT3", :name => "Padang"},
                            {:code => "JKT4", :name => "Jambi"},
                            {:code => "JKT5", :name => "Bali"}
                          ])

