# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsBashToolConfigParams < Anthropic::Internal::Type::BaseModel
        # @!attribute name
        #   Must be "bash".
        #
        #   @return [Symbol, :bash]
        required :name, const: :bash

        # @!attribute enabled
        #   Whether this tool is enabled and available to Claude. Overrides the
        #   default_config setting.
        #
        #   @return [Boolean, nil]
        optional :enabled, Anthropic::Internal::Type::Boolean, nil?: true

        # @!attribute permission_policy
        #   Permission policy for tool execution.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsAlwaysAllowPolicy, Anthropic::Models::Beta::BetaManagedAgentsAlwaysAskPolicy, nil]
        optional :permission_policy,
                 union: -> { Anthropic::Beta::BetaManagedAgentsBashToolConfigParams::PermissionPolicy },
                 nil?: true

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsBashToolConfigParams::Type, nil]
        optional :type, enum: -> { Anthropic::Beta::BetaManagedAgentsBashToolConfigParams::Type }

        # @!method initialize(enabled: nil, permission_policy: nil, type: nil, name: :bash)
        #   Configuration override for the bash tool.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsBashToolConfigParams} for more
        #   details.
        #
        #   @param enabled [Boolean, nil] Whether this tool is enabled and available to Claude. Overrides the default_conf
        #
        #   @param permission_policy [Anthropic::Models::Beta::BetaManagedAgentsAlwaysAllowPolicy, Anthropic::Models::Beta::BetaManagedAgentsAlwaysAskPolicy, nil] Permission policy for tool execution.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsBashToolConfigParams::Type]
        #
        #   @param name [Symbol, :bash] Must be "bash".

        # Permission policy for tool execution.
        #
        # @see Anthropic::Models::Beta::BetaManagedAgentsBashToolConfigParams#permission_policy
        module PermissionPolicy
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # Tool calls are automatically approved without user confirmation.
          variant :always_allow, -> { Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy }

          # Tool calls require user confirmation before execution.
          variant :always_ask, -> { Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsAlwaysAllowPolicy, Anthropic::Models::Beta::BetaManagedAgentsAlwaysAskPolicy)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::BetaManagedAgentsAlwaysAllowPolicy, Anthropic::Models::Beta::BetaManagedAgentsAlwaysAskPolicy]
          def self.new(type:, **args)
            case type.to_sym
            when :always_allow
              Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy.new(**args)
            when :always_ask
              Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end

        # @see Anthropic::Models::Beta::BetaManagedAgentsBashToolConfigParams#type
        module Type
          extend Anthropic::Internal::Type::Enum

          BASH = :bash

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsBashToolConfigParams = Beta::BetaManagedAgentsBashToolConfigParams
  end
end
