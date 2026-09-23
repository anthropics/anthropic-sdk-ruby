# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Workspaces
          class BetaWorkspaceRateLimitWorkspaceSource < Anthropic::Internal::Type::BaseModel
            # @!attribute type
            #   Always `workspace`: a workspace-level override is stored.
            #
            #   @return [Symbol, :workspace]
            required :type, const: :workspace

            # @!method initialize(type: :workspace)
            #   @param type [Symbol, :workspace] Always `workspace`: a workspace-level override is stored.
          end
        end
      end
    end
  end
end
