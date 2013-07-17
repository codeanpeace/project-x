class SearchController < ApplicationController

  def index
    @standards = Standard.all
    @subject_list = []
    @standards.each do |standard|
      standard.subject_method(@subject_list)
    end
  end

  def grade
    @standards_subject = Standard.where(:subject => params[:subject])
    @subject = params[:subject]
    @grade_list = []
    @standards_subject.each do |standard_subject|
      standard_subject.grade_method(@grade_list)
    end
  end

  def topic
    @subject = params[:subject]
    @grade_only = params[:grade]
    @grade = Grade.where(:grade => params[:grade])
    @grade_standards = @grade[0].standards
    @topic_list = []
    @grade_standards.each do |grade_standard|
      grade_standard.topic_method(@topic_list, @subject)
    end
  end

end
