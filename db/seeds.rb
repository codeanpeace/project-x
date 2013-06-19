require 'open-uri'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

english_standards_file = Nokogiri::XML(File.open("db/la.xml"))
english_standards = english_standards_file.xpath("//LearningStandardItem")

english_standards.each_with_index do |standard, index|

  @topic = case standard.xpath("//StatementCode")[index].children.text.split(".")[2]
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

  new_standard_params = {
    :standard => standard.xpath("//StatementCode")[index].children.text,
    :subject => "English",
    :description => standard.xpath("//Statement")[index].children.text,
    :topic => @topic
  }

  puts new_standard_params

  @new_standard = Standard.create(new_standard_params)

  grades = standard.xpath("//GradeLevels")[index].children.to_a
  grades = grades.select{|x| grades.index(x) % 2 != 0}.map{|x| x.children.text}
  grades.each do |grade|
    @new_standard.grades << Grade.find_or_create_by_grade(grade)
  end
end

