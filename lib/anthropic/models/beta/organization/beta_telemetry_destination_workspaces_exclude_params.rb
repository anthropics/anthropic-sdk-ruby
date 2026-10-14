# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaTelemetryDestinationWorkspacesExcludeParams < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :exclude]
          required :type, const: :exclude

          # @!attribute workspace_ids
          #   The IDs of the workspaces on the destination's list (`wrkspc_...`). At most 100
          #   per request.
          #
          #   On create, these workspaces become the destination's list. If you leave
          #   `workspace_ids` out, the list starts empty. If the API refuses one of the IDs,
          #   it doesn't create the destination.
          #
          #   On update, `workspace_ids` replaces the whole list. A workspace that stays on
          #   the list keeps its entry and its `created_at`. An empty array empties the list.
          #   If you leave `workspace_ids` out and the type stays the same, the list doesn't
          #   change. If you leave it out and the type changes, the new list starts empty.
          #   After a change to `include` without `workspace_ids`, the destination doesn't
          #   cover any workspace until one is added. After a change to `exclude` without
          #   `workspace_ids`, it covers every workspace.
          #
          #   An ID sent more than once is added once. An archived workspace can't be added to
          #   a list. An update can keep an archived workspace that is already on the list.
          #
          #   @return [Array<String>, nil]
          optional :workspace_ids, Anthropic::Internal::Type::ArrayOf[String]

          # @!method initialize(workspace_ids: nil, type: :exclude)
          #   Cover every workspace of the organization except the workspaces on the list.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesExcludeParams}
          #   for more details.
          #
          #   @param workspace_ids [Array<String>] The IDs of the workspaces on the destination's list (`wrkspc_...`). At most 100
          #
          #   @param type [Symbol, :exclude]
        end
      end
    end
  end
end
