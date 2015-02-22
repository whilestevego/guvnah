class ActSummariesController < ApplicationController
  before_action :set_act_summary, only: [:show]

  def show
    respond_to do |format|
        format.json { render :json => @act_summary }
    end
  end

  def index
    @act_summaries = ActSummary.where(language: 'eng').order(:title).page(params[:page])

    respond_to do |format|
        format.json { render :json => @act_summaries }
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
