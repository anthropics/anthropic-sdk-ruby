# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaTelemetryDestinationWorkspacesExcludeParams < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesExcludeParams,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # The IDs of the workspaces on the destination's list (`wrkspc_...`). At most 100
          # per request.
          #
          # On create, these workspaces become the destination's list. If you leave
          # `workspace_ids` out, the list starts empty. If the API refuses one of the IDs,
          # it doesn't create the destination.
          #
          # On update, `workspace_ids` replaces the whole list. A workspace that stays on
          # the list keeps its entry and its `created_at`. An empty array empties the list.
          # If you leave `workspace_ids` out and the type stays the same, the list doesn't
          # change. If you leave it out and the type changes, the new list starts empty.
          # After a change to `include` without `workspace_ids`, the destination doesn't
          # cover any workspace until one is added. After a change to `exclude` without
          # `workspace_ids`, it covers every workspace.
          #
          # An ID sent more than once is added once. An archived workspace can't be added to
          # a list. An update can keep an archived workspace that is already on the list.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :workspace_ids

          sig { params(workspace_ids: T::Array[String]).void }
          attr_writer :workspace_ids

          # Cover every workspace of the organization except the workspaces on the list.
          sig do
            params(workspace_ids: T::Array[String], type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # The IDs of the workspaces on the destination's list (`wrkspc_...`). At most 100
            # per request.
            #
            # On create, these workspaces become the destination's list. If you leave
            # `workspace_ids` out, the list starts empty. If the API refuses one of the IDs,
            # it doesn't create the destination.
            #
            # On update, `workspace_ids` replaces the whole list. A workspace that stays on
            # the list keeps its entry and its `created_at`. An empty array empties the list.
            # If you leave `workspace_ids` out and the type stays the same, the list doesn't
            # change. If you leave it out and the type changes, the new list starts empty.
            # After a change to `include` without `workspace_ids`, the destination doesn't
            # cover any workspace until one is added. After a change to `exclude` without
            # `workspace_ids`, it covers every workspace.
            #
            # An ID sent more than once is added once. An archived workspace can't be added to
            # a list. An update can keep an archived workspace that is already on the list.
            workspace_ids: nil,
            type: :exclude
          )
          end

          sig do
            override.returns({ type: Symbol, workspace_ids: T::Array[String] })
          end
          def to_hash
          end
        end
      end
    end
  end
end
