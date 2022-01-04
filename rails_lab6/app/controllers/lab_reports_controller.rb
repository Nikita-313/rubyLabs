class LabReportsController < ApplicationController

  def index
    @lab_reports = LabReport.all
    @users = User.all
  end

  def new
    @lab_report = LabReport.new
    @users = User.all
  end

  def create
    @lab_report = LabReport.new title: params[:lab_report][:title], description: params[:lab_report][:description], user_id: params[:lab_report][:user_id]
    if @lab_report.save
      redirect_to lab_reports_path
    else
      @users = User.all
      render :new
    end
  end

  def edit
    @lab_report = LabReport.find_by id: params[:id]
  end

  def update
    @lab_report = LabReport.find_by id: params[:id]
    if @lab_report.update grade: params[:lab_report][:grade]
      redirect_to lab_reports_path
    else
      render :edit
    end
  end

  def destroy
    @lab_report = LabReport.find_by id: params[:id]
    @lab_report.destroy
    redirect_to lab_reports_path
  end

end