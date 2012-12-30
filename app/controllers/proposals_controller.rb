class ProposalsController < InheritedResources::Base
  respond_to :html, :json

  def index
    @last_update = Proposal.maximum(:updated_at)
    super
  end
end