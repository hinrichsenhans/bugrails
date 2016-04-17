# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Status.create(:name => "NEW")
Status.create(:name => "ASSIGNED")
Status.create(:name => "RESOLVED")
Status.create(:name => "VERIFIED")
Status.create(:name => "CLOSED")
Status.create(:name => "REOPENED")

Substatus.create(:name => "---")
Substatus.create(:name => "FIXED")
Substatus.create(:name => "INVALID")
Substatus.create(:name => "WONTFIX")
Substatus.create(:name => "DUPLICATE")
Substatus.create(:name => "WORKSFORME")