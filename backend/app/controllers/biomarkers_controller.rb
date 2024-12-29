class BiomarkersController < ApplicationController
  before_action :authenticate_user!

  def index
    @biomarkers = UserBiomarker.includes(:biomarker_records).where(user: current_user)
  end

  def show
    @user_biomarker = current_user.user_biomarkers.includes(:biomarker, :biomarker_records).find_by!(biomarker_id: params[:id])
    @biomarker_records = @user_biomarker.biomarker_records.order(recorded_at: :desc)
  end

  def create
    @biomarker = current_user.user_biomarkers.build(biomarker_id: params[:biomarker_id])

    if @biomarker.save
      redirect_to biomarkers_path, notice: "Biomarker added to tracking"
    else
      redirect_to biomarkers_path, alert: "Unable to add biomarker"
    end
  end

  def destroy
    @biomarker = current_user.user_biomarkers.find_by(biomarker_id: params[:id])
    @biomarker.destroy

    redirect_to biomarkers_path, notice: "Biomarker removed from tracking"
  end
end
