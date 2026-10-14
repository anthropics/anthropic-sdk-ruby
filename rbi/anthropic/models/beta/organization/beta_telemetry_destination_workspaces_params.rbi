# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # Which of the organization's workspaces a telemetry destination covers, as a
        # create or update request sets it.
        module BetaTelemetryDestinationWorkspacesParams
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesAllParams,
                Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesIncludeParams,
                Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesExcludeParams
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesParams::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ALL =
              T.let(
                :all,
                Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesParams::Type::TaggedSymbol
              )
            INCLUDE =
              T.let(
                :include,
                Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesParams::Type::TaggedSymbol
              )
            EXCLUDE =
              T.let(
                :exclude,
                Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesParams::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesParams::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesParams::Variants
              ]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type:
                Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesParams::Type::OrSymbol,
              workspace_ids: T::Array[String]
            ).returns(
              Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesParams::Variants
            )
          end
          def self.new(
            type:,
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
            workspace_ids: nil
          )
          end
        end
      end
    end
  end
end
