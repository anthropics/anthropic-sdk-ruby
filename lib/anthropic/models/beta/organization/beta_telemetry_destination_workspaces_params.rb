# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # Which of the organization's workspaces a telemetry destination covers, as a
        # create or update request sets it.
        module BetaTelemetryDestinationWorkspacesParams
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # Cover every workspace of the organization. Doesn't take `workspace_ids`.
          #
          # An update that sets `all` empties the destination's workspace list.
          variant :all, -> { Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesAllParams }

          # Cover only the workspaces on the list.
          variant :include, -> { Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesIncludeParams }

          # Cover every workspace of the organization except the workspaces on the list.
          variant :exclude, -> { Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesExcludeParams }

          module Type
            extend Anthropic::Internal::Type::Enum

            ALL = :all
            INCLUDE = :include
            EXCLUDE = :exclude

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesAllParams, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesIncludeParams, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesExcludeParams)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesParams}
          # for more details.
          #
          # @param type [Symbol, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesParams::Type, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [Array<String>] :workspace_ids The IDs of the workspaces on the destination's list (`wrkspc_...`). At most 100
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesAllParams, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesIncludeParams, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesExcludeParams]
          def self.new(type:, **args)
            case type.to_sym
            when :all
              Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesAllParams.new(**args)
            when :include
              Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesIncludeParams.new(**args)
            when :exclude
              Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesExcludeParams.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end
  end
end
