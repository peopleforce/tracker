class BiomarkerRecordsController < ApplicationController
  before_action :set_biomarker, only: [ :new, :create ]

  def index
    @biomarker_records = current_user.biomarker_records.includes(:biomarker).recent
  end

  def new
    @biomarker = current_user.biomarkers.find(params[:biomarker_id])
    @user_biomarker = current_user.user_biomarkers.find_by(biomarker_id: params[:biomarker_id])
    @biomarker_record = @user_biomarker.biomarker_records.new
    @biomarker_record.recorded_at = Time.current
  end

  def create
    @biomarker = current_user.biomarkers.find(params[:biomarker_id])
    @user_biomarker = current_user.user_biomarkers.find_by(biomarker_id: params[:biomarker_id])
    @biomarker_record = @user_biomarker.biomarker_records.new(permit_params)

    if @biomarker_record.save
      redirect_to biomarker_path(@biomarker), notice: "Record added successfully"
    else
      flash.now[:alert] = "Please correct the errors below"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user_biomarker = current_user.user_biomarkers.find_by(biomarker_id: params[:biomarker_id])
    @biomarker_record = @user_biomarker.biomarker_records.find(params[:id])
    @biomarker_record.destroy
    redirect_to biomarker_path(@user_biomarker.biomarker), notice: "Record deleted successfully"
  end

  private

  def set_biomarker
    @biomarker = current_user.biomarkers.find(params[:biomarker_id])
  end

  def permit_params
    params.require(:biomarker_record).permit(:value, :recorded_at, :notes)
  end
end
