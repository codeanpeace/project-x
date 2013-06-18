# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

b = la.xpath("//LearningStandardItem").to_a

b.each do |something|
  c = something.children.to_a
  code = c[5].children.text
  s = Standard.create(:standard => code)
  grades = c[-4].children.to_a
  grades = grades.select{|x| grades.index(x) % 2 != 0}.map{|x| x.children.text}
  grades.each do |y|
    s.grades << Grade.create_or_find_by_name(y)
  end
end
