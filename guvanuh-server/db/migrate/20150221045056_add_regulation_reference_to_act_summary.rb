class AddRegulationReferenceToActSummary < ActiveRecord::Migration
  def change
    add_reference :regulations, :act_summaries, index: true
  end
end
