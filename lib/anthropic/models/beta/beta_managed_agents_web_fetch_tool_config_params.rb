# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsWebFetchToolConfigParams < Anthropic::Internal::Type::BaseModel
        # @!attribute name
        #   Must be "web_fetch".
        #
        #   @return [Symbol, :web_fetch]
        required :name, const: :web_fetch

        # @!attribute allowed_domains
        #   Only fetch URLs whose host is one of these domains or a subdomain of one. Each
        #   entry is a plain hostname like "docs.example.com" (no scheme, port, or path). At
        #   most 64 entries; an empty list is rejected (omit the field instead). Cannot be
        #   combined with blocked_domains.
        #
        #   @return [Array<String>, nil]
        optional :allowed_domains, Anthropic::Internal::Type::ArrayOf[String]

        # @!attribute blocked_domains
        #   Never fetch URLs whose host is one of these domains or a subdomain of one. Each
        #   entry is a plain hostname like "ads.example.com" (no scheme, port, or path). At
        #   most 64 entries; an empty list is rejected (omit the field instead). Cannot be
        #   combined with allowed_domains.
        #
        #   @return [Array<String>, nil]
        optional :blocked_domains, Anthropic::Internal::Type::ArrayOf[String]

        # @!attribute enabled
        #   Whether this tool is enabled and available to Claude. Overrides the
        #   default_config setting.
        #
        #   @return [Boolean, nil]
        optional :enabled, Anthropic::Internal::Type::Boolean, nil?: true

        # @!attribute max_content_tokens
        #   Maximum number of tokens of fetched text content to include in context per call.
        #   Does not apply to binary content such as PDFs.
        #
        #   @return [Integer, nil]
        optional :max_content_tokens, Integer, nil?: true

        # @!attribute permission_policy
        #   Permission policy for tool execution.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsAlwaysAllowPolicy, Anthropic::Models::Beta::BetaManagedAgentsAlwaysAskPolicy, nil]
        optional :permission_policy,
                 union: -> { Anthropic::Beta::BetaManagedAgentsWebFetchToolConfigParams::PermissionPolicy },
                 nil?: true

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsWebFetchToolConfigParams::Type, nil]
        optional :type, enum: -> { Anthropic::Beta::BetaManagedAgentsWebFetchToolConfigParams::Type }

        # @!method initialize(allowed_domains: nil, blocked_domains: nil, enabled: nil, max_content_tokens: nil, permission_policy: nil, type: nil, name: :web_fetch)
        #   Configuration override for the web_fetch tool.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsWebFetchToolConfigParams} for more
        #   details.
        #
        #   @param allowed_domains [Array<String>] Only fetch URLs whose host is one of these domains or a subdomain of one. Each e
        #
        #   @param blocked_domains [Array<String>] Never fetch URLs whose host is one of these domains or a subdomain of one. Each
        #
        #   @param enabled [Boolean, nil] Whether this tool is enabled and available to Claude. Overrides the default_conf
        #
        #   @param max_content_tokens [Integer, nil] Maximum number of tokens of fetched text content to include in context per call.
        #
        #   @param permission_policy [Anthropic::Models::Beta::BetaManagedAgentsAlwaysAllowPolicy, Anthropic::Models::Beta::BetaManagedAgentsAlwaysAskPolicy, nil] Permission policy for tool execution.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsWebFetchToolConfigParams::Type]
        #
        #   @param name [Symbol, :web_fetch] Must be "web_fetch".

        # Permission policy for tool execution.
        #
        # @see Anthropic::Models::Beta::BetaManagedAgentsWebFetchToolConfigParams#permission_policy
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

        # @see Anthropic::Models::Beta::BetaManagedAgentsWebFetchToolConfigParams#type
        module Type
          extend Anthropic::Internal::Type::Enum

          WEB_FETCH = :web_fetch

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsWebFetchToolConfigParams = Beta::BetaManagedAgentsWebFetchToolConfigParams
  end
end
