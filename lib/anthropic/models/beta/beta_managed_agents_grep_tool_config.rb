# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsGrepToolConfig < Anthropic::Internal::Type::BaseModel
        # @!attribute enabled
        #
        #   @return [Boolean]
        required :enabled, Anthropic::Internal::Type::Boolean

        # @!attribute name
        #
        #   @return [Symbol, :grep]
        required :name, const: :grep

        # @!attribute permission_policy
        #   Permission policy for tool execution.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsAlwaysAllowPolicy, Anthropic::Models::Beta::BetaManagedAgentsAlwaysAskPolicy]
        required :permission_policy,
                 union: -> { Anthropic::Beta::BetaManagedAgentsGrepToolConfig::PermissionPolicy }

        # @!attribute type
        #
        #   @return [Symbol, :grep]
        required :type, const: :grep

        # @!method initialize(enabled:, permission_policy:, name: :grep, type: :grep)
        #   Configuration for the grep tool.
        #
        #   @param enabled [Boolean]
        #
        #   @param permission_policy [Anthropic::Models::Beta::BetaManagedAgentsAlwaysAllowPolicy, Anthropic::Models::Beta::BetaManagedAgentsAlwaysAskPolicy] Permission policy for tool execution.
        #
        #   @param name [Symbol, :grep]
        #
        #   @param type [Symbol, :grep]

        # Permission policy for tool execution.
        #
        # @see Anthropic::Models::Beta::BetaManagedAgentsGrepToolConfig#permission_policy
        module PermissionPolicy
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # Tool calls are automatically approved without user confirmation.
          variant :always_allow, -> { Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy }

          # Tool calls require user confirmation before execution.
          variant :always_ask, -> { Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy }

          module Type
            extend Anthropic::Internal::Type::Enum

            ALWAYS_ALLOW = :always_allow
            ALWAYS_ASK = :always_ask

            # @!method self.values
            #   @return [Array<Symbol>]
          end

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
      end
    end

    BetaManagedAgentsGrepToolConfig = Beta::BetaManagedAgentsGrepToolConfig
  end
end
