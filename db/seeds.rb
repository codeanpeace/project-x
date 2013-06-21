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
    :standard => standard.xpath("//StatementCode")[index].children.text[18..-1],
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





# math_standards_file = Nokogiri::XML(File.open("db/math.xml"))
# math_standards = math_standards_file.xpath("//LearningStandardItem")

# math_standards.each_with_index do |standard, index|

#   standard_array = standard.xpath("//StatementCode")[index].children.text.split(".")
#   if standard_array[3] == "K"
#     @topic_id = standard_array[4]
#   elsif standard_array[3].to_i != 0
#     @topic_id = standard_array[4]
#   else
#     @topic_id = standard_array[3]
#   end

#   @topic = case @topic_id
#     when "CC"
#       "Counting & Cardinality"
#     when "OA"
#       "Operations & Algebraic Thinking"
#     when "NBT"
#       "Number & Operations in Base Ten"
#     when "MD"
#       "Measurement & Data"
#     when "G"
#       "Geometry"
#     when "NF"
#       "Number & Operations-Fractions"
#     when "RP"
#       "Ratios & Proportional Relationships"
#     when "NS"
#       "The Number System"
#     when "EE"
#       "Expressions & Equations"
#     when "SP"
#       "Statistics & Probability"
#     when "F"
#       "Functions"
#     when "N-RN"
#       "The Real Number System"
#     when "N-Q"
#       "Quantities"
#     when "N-CN"
#       "The Complex Number System"
#     when "N-VM"
#       "Vector & Matrix Quantities"
#     when "A-SSE"
#       "Seeing Structure in Expressions"
#     when "A-APR"
#       "Arithmetic with Polynomials & Rational Expressions"
#     when "A-CED"
#       "Creating Equations"
#     when "A-REI"
#       "Reasoning with Equations & Inequalities"
#     when "F-IF"
#       "Interpreting Functions"
#     when "F-BF"
#       "Building Functions"
#     when "F-LE"
#       "Linear, Quadratic, & Exponential Models"
#     when "F-TF"
#       "Trigonometric Functions"
#     when "G-CO"
#       "Congruence"
#     when "G-SRT"
#       "Similarity, Right Triangles, & Trigonometry"
#     when "F-C"
#       "Circles"
#     when "F-GPE"
#       "Expressing Geometric Properties with Equations"
#     when "F-GMD"
#       "Geometric Measurement & Dimension"
#     when "F-MG"
#       "Modeling with Geometry"
#     when "S-ID"
#       "Interpreting Categorical & Quantitative Data"
#     when "S-IC"
#       "Making Inferences & Justifying Conclusions"
#     when "S-CP"
#       "Conditional Probability & the Rules of Probability"
#     when "S-MD"
#       "Using Probability to Make Decisions"
#     else
#       puts "No Match!"
#   end

#   new_standard_params = {
#     :standard => standard.xpath("//StatementCode")[index].children.text,
#     :subject => "Math",
#     :description => standard.xpath("//Statement")[index].children.text,
#     :topic => @topic
#   }

#   puts new_standard_params

#   @new_standard = Standard.create(new_standard_params)

#   grades = standard.xpath("//GradeLevels")[index].children.to_a
#   grades = grades.select{|x| grades.index(x) % 2 != 0}.map{|x| x.children.text}
#   grades.each do |grade|
#     @new_standard.grades << Grade.find_or_create_by_grade(grade)
#   end
# end

# learnist_resources = Nokogiri::HTML(File.open("db/learnist.html"))


khan = Nokogiri::HTML(File.open("db/khan.html"))
khan_standards = khan.css("tr.domain-standards")

khan_standards.each_with_index do |standard, index|

  standard_code = standard.css('td.standard').text
  @topic_id = standard.children[0].text.split(".")[1]
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
      "Number & Operations-Fractions"
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
    when "N-RN"
      "The Real Number System"
    when "N-Q"
      "Quantities"
    when "N-CN"
      "The Complex Number System"
    when "N-VM"
      "Vector & Matrix Quantities"
    when "A-SSE"
      "Seeing Structure in Expressions"
    when "A-APR"
      "Arithmetic with Polynomials & Rational Expressions"
    when "A-CED"
      "Creating Equations"
    when "A-REI"
      "Reasoning with Equations & Inequalities"
    when "F-IF"
      "Interpreting Functions"
    when "F-BF"
      "Building Functions"
    when "F-LE"
      "Linear, Quadratic, & Exponential Models"
    when "F-TF"
      "Trigonometric Functions"
    when "G-CO"
      "Congruence"
    when "G-SRT"
      "Similarity, Right Triangles, & Trigonometry"
    when "F-C"
      "Circles"
    when "F-GPE"
      "Expressing Geometric Properties with Equations"
    when "F-GMD"
      "Geometric Measurement & Dimension"
    when "F-MG"
      "Modeling with Geometry"
    when "S-ID"
      "Interpreting Categorical & Quantitative Data"
    when "S-IC"
      "Making Inferences & Justifying Conclusions"
    when "S-CP"
      "Conditional Probability & the Rules of Probability"
    when "S-MD"
      "Using Probability to Make Decisions"
    else
      puts "No Match!"
  end

  new_standard_params = {
    :standard => standard.children[0].text,
    :subject => "Math",
    :description => standard.children[2].text,
    :topic => @topic
  }

  puts "New standard parameters: "
  puts new_standard_params
  puts "\n"
  puts "\n"

  @new_standard = Standard.create(new_standard_params)

  @new_standard.grades << Grade.find_or_create_by_grade(@new_standard.standard.split('.')[0])

  standard.css('a').each_with_index do |resource, i|
    new_resource_params = {
      :name => resource.children[0].text,
      :type => "arc",
      :url => resource.attributes["href"].value,
      :source => "Khan Academy"
    }

    puts "New resource parameters: "
    puts new_resource_params
    puts "\n"

    @new_resource = Resource.create(new_resource_params)
    @new_resource.standards << @new_standard

  end
end



@xpmath_game_links = []
xpmath = Nokogiri::HTML(open('http://xpmath.com'))
xpmath.css('table.gamesTable td').each_with_index do |game, index|

  puts game

  begin
    @xpmath_game_links << game.children[1].attributes['href'].value
  rescue
  end
end

puts @xpmath_game_links

@xpmath_game_links.each do |link|

  game = Nokogiri::HTML(open(link))

  new_resource_params = {
    :name => game.css('td > b')[0].children.text,
    :type => "game",
    :url => link,
    :source => "XP Math"
  }

  puts "New resource parameters: "
  puts new_resource_params
  puts "\n"

  @new_resource = Resource.create(new_resource_params)

  standard_name = game.css('div.smallfont b')[0].children.text
  if standard_name[-1] == '.'
    standard_name = standard_name[0..-2]
  else
  end
  related_standard = Standard.find_by_standard(standard_name)

  puts "Standard name: "
  puts standard_name
  puts "Related standard: "
  puts related_standard

  begin
    @new_resource.standards << related_standard
  rescue
  end
end