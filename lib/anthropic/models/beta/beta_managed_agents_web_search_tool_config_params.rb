# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsWebSearchToolConfigParams < Anthropic::Internal::Type::BaseModel
        # @!attribute name
        #   Must be "web_search".
        #
        #   @return [Symbol, :web_search]
        required :name, const: :web_search

        # @!attribute allowed_domains
        #   Only return search results whose host is one of these domains or a subdomain of
        #   one. Each entry is a plain hostname like "docs.example.com" (no scheme or port;
        #   an optional path suffix is accepted). At most 64 entries; an empty list is
        #   rejected (omit the field instead). Cannot be combined with blocked_domains.
        #
        #   @return [Array<String>, nil]
        optional :allowed_domains, Anthropic::Internal::Type::ArrayOf[String]

        # @!attribute blocked_domains
        #   Never return search results whose host is one of these domains or a subdomain of
        #   one. Each entry is a plain hostname like "ads.example.com" (no scheme or port;
        #   an optional path suffix is accepted). At most 64 entries; an empty list is
        #   rejected (omit the field instead). Cannot be combined with allowed_domains.
        #
        #   @return [Array<String>, nil]
        optional :blocked_domains, Anthropic::Internal::Type::ArrayOf[String]

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
                 union: -> { Anthropic::Beta::BetaManagedAgentsWebSearchToolConfigParams::PermissionPolicy },
                 nil?: true

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsWebSearchToolConfigParams::Type, nil]
        optional :type, enum: -> { Anthropic::Beta::BetaManagedAgentsWebSearchToolConfigParams::Type }

        # @!attribute user_location
        #   Approximate user location for search result localization.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsUserLocation, nil]
        optional :user_location, -> { Anthropic::Beta::BetaManagedAgentsUserLocation }, nil?: true

        # @!method initialize(allowed_domains: nil, blocked_domains: nil, enabled: nil, permission_policy: nil, type: nil, user_location: nil, name: :web_search)
        #   Configuration override for the web_search tool.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsWebSearchToolConfigParams} for more
        #   details.
        #
        #   @param allowed_domains [Array<String>] Only return search results whose host is one of these domains or a subdomain of
        #
        #   @param blocked_domains [Array<String>] Never return search results whose host is one of these domains or a subdomain of
        #
        #   @param enabled [Boolean, nil] Whether this tool is enabled and available to Claude. Overrides the default_conf
        #
        #   @param permission_policy [Anthropic::Models::Beta::BetaManagedAgentsAlwaysAllowPolicy, Anthropic::Models::Beta::BetaManagedAgentsAlwaysAskPolicy, nil] Permission policy for tool execution.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsWebSearchToolConfigParams::Type]
        #
        #   @param user_location [Anthropic::Models::Beta::BetaManagedAgentsUserLocation, nil] Approximate user location for search result localization.
        #
        #   @param name [Symbol, :web_search] Must be "web_search".

        # Permission policy for tool execution.
        #
        # @see Anthropic::Models::Beta::BetaManagedAgentsWebSearchToolConfigParams#permission_policy
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

        # @see Anthropic::Models::Beta::BetaManagedAgentsWebSearchToolConfigParams#type
        module Type
          extend Anthropic::Internal::Type::Enum

          WEB_SEARCH = :web_search

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsWebSearchToolConfigParams = Beta::BetaManagedAgentsWebSearchToolConfigParams
  end
end
