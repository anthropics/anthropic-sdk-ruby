# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAPIKeyOrganizationScope < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #   Scope type. Always `"organization"`: the API key has no Workspace. Only a
          #   principal-bound API key can have this scope.
          #
          #   @return [Symbol, :organization]
          required :type, const: :organization

          # @!method initialize(type: :organization)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAPIKeyOrganizationScope} for more
          #   details.
          #
          #   @param type [Symbol, :organization] Scope type. Always `"organization"`: the API key has no Workspace. Only a princi
        end
      end
    end
  end
end
