class ActsController < ApplicationController
  before_action :set_act, only: [:show]

  def show
    respond_to do |format|
      format.html { render :json => @act.raw_html }
      format.json { render :json => @act }
    end
  end

  def index
    @acts = Act.page(params[:page])

    respond_to do |format|
      format.json { render :json => @acts }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_act
      @act = Act.find(params[:id])
    end
end