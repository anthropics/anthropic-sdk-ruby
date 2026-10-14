# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # Which of the organization's workspaces a telemetry destination covers.
        #
        # Several destinations can cover the same workspace. Each of them receives the
        # workspace's spans while it is enabled.
        #
        # The workspace list of an `include` or `exclude` destination isn't part of the
        # destination object. List the destination's workspaces to read it. Add or remove
        # one workspace at a time, or replace the whole list with an update. A list holds
        # at most 1,000 workspaces.
        module BetaTelemetryDestinationWorkspaces
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesAll,
                Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesInclude,
                Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesExclude
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspaces::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ALL =
              T.let(
                :all,
                Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspaces::Type::TaggedSymbol
              )
            INCLUDE =
              T.let(
                :include,
                Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspaces::Type::TaggedSymbol
              )
            EXCLUDE =
              T.let(
                :exclude,
                Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspaces::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspaces::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspaces::Variants
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
                Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspaces::Type::OrSymbol
            ).returns(
              Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspaces::Variants
            )
          end
          def self.new(type:)
          end
        end
      end
    end
  end
end
