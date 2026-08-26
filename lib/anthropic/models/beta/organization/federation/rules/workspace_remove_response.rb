# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Federation
          module Rules
            # @see Anthropic::Resources::Beta::Organization::Federation::Rules::Workspaces#remove
            class WorkspaceRemoveResponse < Anthropic::Internal::Type::BaseModel
              # @!attribute federation_rule_id
              #   Tagged ID of the federation rule.
              #
              #   @return [String]
              required :federation_rule_id, String

              # @!attribute type
              #
              #   @return [Symbol, :federation_rule_workspace_deleted]
              required :type, const: :federation_rule_workspace_deleted

              # @!attribute workspace_id
              #   Tagged ID of the workspace named in the delete request. Removal is idempotent.
              #
              #   @return [String]
              required :workspace_id, String

              # @!method initialize(federation_rule_id:, workspace_id:, type: :federation_rule_workspace_deleted)
              #   @param federation_rule_id [String] Tagged ID of the federation rule.
              #
              #   @param workspace_id [String] Tagged ID of the workspace named in the delete request. Removal is idempotent.
              #
              #   @param type [Symbol, :federation_rule_workspace_deleted]
            end
          end
        end
      end
    end
  end
end
