# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Workspaces
          class BetaWorkspaceRateLimitOrganizationSource < Anthropic::Internal::Type::BaseModel
            # @!attribute type
            #   Always `organization`: no workspace-level override is stored, so the
            #   organization's value applies.
            #
            #   @return [Symbol, :organization]
            required :type, const: :organization

            # @!method initialize(type: :organization)
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::Workspaces::BetaWorkspaceRateLimitOrganizationSource}
            #   for more details.
            #
            #   @param type [Symbol, :organization] Always `organization`: no workspace-level override is stored, so the organizatio
          end
        end
      end
    end
  end
end
