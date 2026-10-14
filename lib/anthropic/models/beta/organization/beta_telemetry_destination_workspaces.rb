# frozen_string_literal: true

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

          discriminator :type

          # The destination covers every workspace of the organization, including the default workspace, archived workspaces, and workspaces created later. It doesn't have a list.
          variant :all, -> { Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesAll }

          # The destination covers the workspaces on its list, and no others.
          variant :include, -> { Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesInclude }

          # The destination covers every workspace of the organization except the workspaces on its list. A workspace created later is covered until it is added to the list.
          variant :exclude, -> { Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesExclude }

          module Type
            extend Anthropic::Internal::Type::Enum

            ALL = :all
            INCLUDE = :include
            EXCLUDE = :exclude

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesAll, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesInclude, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesExclude)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspaces::Type, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesAll, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesInclude, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesExclude]
          def self.new(type:, **args)
            case type.to_sym
            when :all
              Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesAll.new(**args)
            when :include
              Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesInclude.new(**args)
            when :exclude
              Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesExclude.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end
  end
end
