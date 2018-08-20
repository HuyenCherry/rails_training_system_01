class UserReportsController < ApplicationController
  before_action :load_event, only: [:show, :edit, :update, :destroy]

  def index
    byebug
    user_course = UserCourse.where user_id: current_user.id
    user_subject = UserSubject.where user_id: current_user.id,
      user_course_id: user_course.first.id
    @user_reports = UserReport.where user_id: current_user.id,
      user_subject_id: user_subject.first.id
    respond_to do |format|
      format.html { render 'index' }
      format.json { render json: @user_reports }
    end
  end

  def show
    respond_to do |format|
      format.html { render 'show' }
      format.json { render json: @user_report }
    end
  end

  def new
    @user_report = UserReport.new
  end

  def edit
  end

  def create
    user_course = UserCourse.where(user_id: current_user.id).where "end_date > ?", Date.current
    user_subject = UserSubject.find_by user_id: current_user.id,
      user_course_id: user_course.first.id
    @user_report = UserReport.new user_id: current_user.id,
      user_subject_id: user_subject.id, title: params[:user_report][:title],
      content: params[:user_report][:content]
    @user_report.save
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @user_report.update_attributes event_params
  end

  def destroy
    @user_report.destroy
  end

  private
  def load_event
    @user_report = UserReport.find_by id: params[:id]
  end

  def event_params
    params.require(:user_report).permit(:title, :content)
  end
end
