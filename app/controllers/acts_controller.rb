class ActsController < ApplicationController
  before_action :set_act, only: [:show]

  def show
    respond_to do |format|
      format.html { render template: "acts/show", locals: {raw_html: @act.raw_html }}
      format.json { render :json => @act(include: :act_summary) }
    end
  end

  def index
    @acts = Act.page(params[:page])

    respond_to do |format|
      format.json { render :json => @acts.to_json(include: :act_summary) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_act
      @act = Act.find(params[:id])
    end
end
