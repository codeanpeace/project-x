require 'open-uri'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

english_standards_file = Nokogiri::XML(File.open("la.xml"))
english_standards = english_standards_file.xpath("//LearningStandardItem")

english_standards.each do |standard|
  @new_standard = Standard.new
  @new_standard.update_attribute(:standard => standard.xpath("//StatementCode")[0].children.text)
  @new_standard.update_attribute(:subject => "English")
  @new_standard.update_attribute(:description => standard.xpath("//Statement")[0].children.text)

  @id_code = standard.xpath("//StatementCode")[0].children.text.split(".")[2]
  @topic = case @id_code
    when "CCRA"
      "College and Career Readiness Anchor"
    when "RL"
      "Reading: Literature"
    when "RI"
      "Reading: Foundational Skills"
    when "W"
      "Writing"
    when "SL"
      "Speaking & Listening"
    when "L"
      "Language"
    when "RH"
      "History/Social Studies"
    when "RST"
      "Science & Technical Subjects"
    when "WHST"
      "Writing"
    else
      puts "No Match!"
  end
  @new_standard.update_attribute(:topic => @topic)

  grades = standard.xpath("//GradeLevels")[0].children.to_a
  grades = grades.select{|x| grades.index(x) % 2 != 0}.map{|x| x.children.text}
  grades.each do |grade|
    @new_standard.grades << Grade.create_or_find_by_name(grade)
  end
end





