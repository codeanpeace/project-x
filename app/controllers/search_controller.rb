class SearchController < ApplicationController

  skip_before_filter :require_login

  def index
    @subject_list = Standard.subject_list
    # @standards = Standard.select(:subject)
    # @subject_list = []
    # @standards.each do |standard|
    #   if !@subject_list.include?(standard.subject)
    #     @subject_list << standard.subject
    #   end
    # end
    # @standards = Standard.all{:subject}
    # @subject_list = []
    # @standards.each do |standard|
    #   standard.subject_method(@subject_list)
    # end
  end

  def grade
    @grade_list = Standard.grade_list(params[:subject])
    @subject = params[:subject]
    # @standards_subject = Standard.where(:subject => params[:subject])
    # @subject = params[:subject]
    # @grade_list = []
    # @standards_subject.each do |standard_subject|
    #   standard_subject.grade_method(@grade_list)
    # end
  end

  def topic
    @topic_list = Standard.topic_list(params[:subject], params[:grade])
    @grade = params[:grade]
    @subject = params[:subject]
    # @subject = params[:subject]
    # @grade_only = params[:grade]
    # @grade = Grade.where(:grade => params[:grade])
    # @grade_standards = @grade[0].standards
    # @topic_list = []
    # @grade_standards.each do |grade_standard|
    #   grade_standard.topic_method(@topic_list, @subject)
    # end
  end

end