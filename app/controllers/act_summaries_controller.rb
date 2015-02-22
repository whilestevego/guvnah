class ActSummariesController < ApplicationController
  before_action :set_act_summary, only: [:show]

  def show
    respond_to do |format|
      format.json { render :json => @act_summary.to_json(include: :act) }
    end
  end

  def index
    @act_summaries = ActSummary

    @act_summaries = @act_summaries.search_by_title(params[:search]) if params[:search]
    @act_summaries = @act_summaries.page(params[:page]) if params[:page]
    @act_summaries = @act_summaries.where(language: 'eng').order(:title)

    respond_to do |format|
      format.json { render :json => @act_summaries.to_json(include: :act) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_act_summary
      @act_summary = ActSummary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def act_summary_params
      params.require(:act_summary).permit(:id, :unique_id, :language, :link_to_xml, :link_to_html_toc, :title, :current_to_date)
    end
end
