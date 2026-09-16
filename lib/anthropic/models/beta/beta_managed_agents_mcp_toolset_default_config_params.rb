# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsMCPToolsetDefaultConfigParams < Anthropic::Internal::Type::BaseModel
        # @!attribute enabled
        #   Whether tools are enabled by default. Defaults to true if not specified.
        #
        #   @return [Boolean, nil]
        optional :enabled, Anthropic::Internal::Type::Boolean, nil?: true

        # @!attribute permission_policy
        #   Permission policy for tool execution.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsAlwaysAllowPolicy, Anthropic::Models::Beta::BetaManagedAgentsAlwaysAskPolicy, Anthropic::Models::Beta::BetaManagedAgentsAutoPolicy, nil]
        optional :permission_policy,
                 union: -> {
                   Anthropic::Beta::BetaManagedAgentsMCPToolsetDefaultConfigParams::PermissionPolicy
                 },
                 nil?: true

        # @!method initialize(enabled: nil, permission_policy: nil)
        #   Default configuration for all tools from an MCP server.
        #
        #   @param enabled [Boolean, nil] Whether tools are enabled by default. Defaults to true if not specified.
        #
        #   @param permission_policy [Anthropic::Models::Beta::BetaManagedAgentsAlwaysAllowPolicy, Anthropic::Models::Beta::BetaManagedAgentsAlwaysAskPolicy, Anthropic::Models::Beta::BetaManagedAgentsAutoPolicy, nil] Permission policy for tool execution.

        # Permission policy for tool execution.
        #
        # @see Anthropic::Models::Beta::BetaManagedAgentsMCPToolsetDefaultConfigParams#permission_policy
        module PermissionPolicy
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # Tool calls are automatically approved without user confirmation.
          variant :always_allow, -> { Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy }

          # Tool calls require user confirmation before execution.
          variant :always_ask, -> { Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy }

          # The server decides each tool call individually: it judges, from the tool, its input, and the session content so far, whether the call is safe to execute or high-risk, and evaluates it to allow when judged safe and to deny when judged high-risk. A call the server cannot reach a judgement on evaluates to ask.
          variant :auto, -> { Anthropic::Beta::BetaManagedAgentsAutoPolicy }

          module Type
            extend Anthropic::Internal::Type::Enum

            ALWAYS_ALLOW = :always_allow
            ALWAYS_ASK = :always_ask
            AUTO = :auto

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsAlwaysAllowPolicy, Anthropic::Models::Beta::BetaManagedAgentsAlwaysAskPolicy, Anthropic::Models::Beta::BetaManagedAgentsAutoPolicy)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMCPToolsetDefaultConfigParams::PermissionPolicy::Type, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::BetaManagedAgentsAlwaysAllowPolicy, Anthropic::Models::Beta::BetaManagedAgentsAlwaysAskPolicy, Anthropic::Models::Beta::BetaManagedAgentsAutoPolicy]
          def self.new(type:, **args)
            case type.to_sym
            when :always_allow
              Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy.new(**args)
            when :always_ask
              Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy.new(**args)
            when :auto
              Anthropic::Beta::BetaManagedAgentsAutoPolicy.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end

    BetaManagedAgentsMCPToolsetDefaultConfigParams = Beta::BetaManagedAgentsMCPToolsetDefaultConfigParams
  end
end
