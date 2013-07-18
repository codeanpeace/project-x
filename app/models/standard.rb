class Standard < ActiveRecord::Base
  attr_accessible :description, :grade, :standard, :subject, :topic

  has_and_belongs_to_many :resources
  has_and_belongs_to_many :bundles
  has_and_belongs_to_many :grades

  # To create an array of relevant subjects
  def self.subject_list
    Standard.select("distinct subject").map {|s| s.subject}
  end
  # def subject_method(subject_list)
  #   if !subject_list.include?(self.subject)
  #     subject_list << self.subject
  #   end
  # end

  #To create an array of grades
  def self.grade_list(subject)
    Standard.where(:subject => subject).joins(:grades).select("distinct grades.grade").map {|g| g.grade}.sort.rotate!(-1)
  end
  # def grade_method(grade_list)
  #  @grades = self.grades
  #   @grades.each do |grade|
  #     if !grade_list.include?(grade.grade)
  #       grade_list << grade.grade
  #     end
  #   end
  # end

  #To create an array of topics
  def self.topic_list(subject, grade)
    Standard.where(:subject => subject).joins(:grades).where(:grades => {:grade => grade}).select("distinct topic").map {|t| t.topic}
  end
  # def topic_method(topic_list, subject)
  #   if self.subject == subject && !topic_list.include?(self.topic) && !self.topic.nil?
  #       topic_list << self.topic
  #   end
  # end

  # #To create an array of standards
  # @standards_subject_topic = Standard.where(:subject => params["subject"], :topic => params["topic"])
  # @standard_list = []
  # @grade_standards.each do |grade_standard|
  #   @standards_subject_topic.each do |standard_subject_topic|
  #     if grade_standard == standard
  #       @standard_list << standard.standard
  #     end
  #   end
  # end

  # #To create an array of resources
  # @topic_new = @topic.split("+").join(" ")
  # @standards_topic_subject_standard = Standard.where(:topic => @topic_new, :subject => params["subject"], :standard => params["standard"])
  # @resource_list = []
  # @grade_standards.each do |grade_standard|
  #   @standards.each do |standard|
  #     if grade_standard == standard
  #       @resource_list << standard.resources
  #     end
  #   end
  # end

end