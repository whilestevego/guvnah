class RegulationsController < ApplicationController
  before_action :set_regulation, only: [:show]

  # GET /products/1
  # GET /products/1.json
  def show
    respond_to do |format|
        format.json { render :json => @regulation }
    end
  end

  # GET /products
  # GET /products.json
  def index
    @regulations = Regulation.where(language: 'eng').order(:title).page(params[:page])

    respond_to do |format|
        format.json { render :json => @regulations }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_act_summary
      @regulation = Regulation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def act_regulation
      params.require(:regulation).permit(:unique_id, :language, :link_to_xml, :link_to_html_toc, :title, :current_to_date, :act_summary_id)
    end
end
