# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaSpendLimitWorkspaceScope < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #   Scope type. Always `workspace` for this scope.
          #
          #   @return [Symbol, :workspace]
          required :type, const: :workspace

          # @!attribute workspace_id
          #   Tagged ID of the workspace the spend limit applies to.
          #
          #   @return [String]
          required :workspace_id, String

          # @!method initialize(workspace_id:, type: :workspace)
          #   Scope selecting one workspace of a Claude Console organization.
          #
          #   @param workspace_id [String] Tagged ID of the workspace the spend limit applies to.
          #
          #   @param type [Symbol, :workspace] Scope type. Always `workspace` for this scope.
        end
      end
    end
  end
end
