# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsWebSearchToolConfig < Anthropic::Internal::Type::BaseModel
        # @!attribute enabled
        #
        #   @return [Boolean]
        required :enabled, Anthropic::Internal::Type::Boolean

        # @!attribute name
        #
        #   @return [Symbol, :web_search]
        required :name, const: :web_search

        # @!attribute permission_policy
        #   Permission policy for tool execution.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsAlwaysAllowPolicy, Anthropic::Models::Beta::BetaManagedAgentsAlwaysAskPolicy]
        required :permission_policy,
                 union: -> { Anthropic::Beta::BetaManagedAgentsWebSearchToolConfig::PermissionPolicy }

        # @!attribute type
        #
        #   @return [Symbol, :web_search]
        required :type, const: :web_search

        # @!attribute allowed_domains
        #
        #   @return [Array<String>, nil]
        optional :allowed_domains, Anthropic::Internal::Type::ArrayOf[String]

        # @!attribute blocked_domains
        #
        #   @return [Array<String>, nil]
        optional :blocked_domains, Anthropic::Internal::Type::ArrayOf[String]

        # @!attribute user_location
        #   Approximate user location for search result localization.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsUserLocation, nil]
        optional :user_location, -> { Anthropic::Beta::BetaManagedAgentsUserLocation }, nil?: true

        # @!method initialize(enabled:, permission_policy:, allowed_domains: nil, blocked_domains: nil, user_location: nil, name: :web_search, type: :web_search)
        #   Configuration for the web_search tool.
        #
        #   @param enabled [Boolean]
        #
        #   @param permission_policy [Anthropic::Models::Beta::BetaManagedAgentsAlwaysAllowPolicy, Anthropic::Models::Beta::BetaManagedAgentsAlwaysAskPolicy] Permission policy for tool execution.
        #
        #   @param allowed_domains [Array<String>]
        #
        #   @param blocked_domains [Array<String>]
        #
        #   @param user_location [Anthropic::Models::Beta::BetaManagedAgentsUserLocation, nil] Approximate user location for search result localization.
        #
        #   @param name [Symbol, :web_search]
        #
        #   @param type [Symbol, :web_search]

        # Permission policy for tool execution.
        #
        # @see Anthropic::Models::Beta::BetaManagedAgentsWebSearchToolConfig#permission_policy
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
      end
    end

    BetaManagedAgentsWebSearchToolConfig = Beta::BetaManagedAgentsWebSearchToolConfig
  end
end
