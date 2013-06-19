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





math_standards_file = Nokogiri::XML(File.open("db/math.xml"))
math_standards = math_standards_file.xpath("//LearningStandardItem")

math_standards.each_with_index do |standard, index|

  standard_array = standard.xpath("//StatementCode")[index].children.text.split(".")
  if standard_array[3] == "K"
    @topic_id = standard_array[4]
  elsif standard_array[3].to_i != 0
    @topic_id = standard_array[4]
  else
    @topic_id = standard_array[3]
  end

  @topic = case @topic_id
    when "CC"
      "Counting & Cardinality"
    when "OA"
      "Operations & Algebraic Thinking"
    when "NBT"
      "Number & Operations in Base Ten"
    when "MD"
      "Measurement & Data"
    when "G"
      "Geometry"
    when "NF"
      "Number & Operations—Fractions"
    when "RP"
      "Ratios & Proportional Relationships"
    when "NS"
      "The Number System"
    when "EE"
      "Expressions & Equations"
    when "SP"
      "Statistics & Probability"
    when "F"
      "Functions"
    when "HSN-RN"
      "The Real Number System"
    when "HSN-Q"
      "Quantities"
    when "HSN-CN"
      "The Complex Number System"
    when "HSN-VM"
      "Vector & Matrix Quantities"
    when "HSA-SSE"
      "Seeing Structure in Expressions"
    when "HSA-APR"
      "Arithmetic with Polynomials & Rational Expressions"
    when "HSA-CED"
      "Creating Equations"
    when "HSA-REI"
      "Reasoning with Equations & Inequalities"
    when "HSF-IF"
      "Interpreting Functions"
    when "HSF-BF"
      "Building Functions"
    when "HSF-LE"
      "Linear, Quadratic, & Exponential Models"
    when "HSF-TF"
      "Trigonometric Functions"
    when "HSG-CO"
      "Congruence"
    when "HSG-SRT"
      "Similarity, Right Triangles, & Trigonometry"
    when "HSF-C"
      "Circles"
    when "HSF-GPE"
      "Expressing Geometric Properties with Equations"
    when "HSF-GMD"
      "Geometric Measurement & Dimension"
    when "HSF-MG"
      "Modeling with Geometry"
    when "HSS-ID"
      "Interpreting Categorical & Quantitative Data"
    when "HSS-IC"
      "Making Inferences & Justifying Conclusions"
    when "HSS-CP"
      "Conditional Probability & the Rules of Probability"
    when "HSS-MD"
      "Using Probability to Make Decisions"
    else
      puts "No Match!"
  end

  new_standard_params = {
    :standard => standard.xpath("//StatementCode")[index].children.text,
    :subject => "Math",
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
