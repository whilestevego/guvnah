class ActSummariesController < ApplicationController
  before_action :set_act_summary, only: [:show]

  # GET /products/1
  # GET /products/1.json
  def show
    respond_to do |format|
        format.json { render :json => @act_summary }
    end
  end

  # GET /products
  # GET /products.json
  def index
    @act_summaries = ActSummary.all

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
    def product_params
      params.require(:product).permit(:id, :unique_id, :language, :link_to_xml, :link_to_html_toc, :title, :current_to_date)
    end
end
