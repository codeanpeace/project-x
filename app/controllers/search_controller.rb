class SearchController < ApplicationController

  def index
    @standards = Standard.all
    @subject_list = []
    @standards.each do |standard|
      standard.subject_method(@subject_list)
    end
  end

  def grade
    @standards_subject = Standard.where(:subject => params["subject"])
    @grade_list = []
    @standards_subject.each do |standard_subject|
      standard_subject.grade_method(@grade_list)
    end
  end

  def topic
    @topic_list
  end

  def standard
    @standard_list
  end

  def resource
    @resource_list
  end

end
