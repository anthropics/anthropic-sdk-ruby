# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsWebFetchToolConfig < Anthropic::Internal::Type::BaseModel
        # @!attribute enabled
        #
        #   @return [Boolean]
        required :enabled, Anthropic::Internal::Type::Boolean

        # @!attribute name
        #
        #   @return [Symbol, :web_fetch]
        required :name, const: :web_fetch

        # @!attribute permission_policy
        #   Permission policy for tool execution.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsAlwaysAllowPolicy, Anthropic::Models::Beta::BetaManagedAgentsAlwaysAskPolicy, Anthropic::Models::Beta::BetaManagedAgentsAutoPolicy]
        required :permission_policy,
                 union: -> { Anthropic::Beta::BetaManagedAgentsWebFetchToolConfig::PermissionPolicy }

        # @!attribute type
        #
        #   @return [Symbol, :web_fetch]
        required :type, const: :web_fetch

        # @!attribute url_sources
        #   Which sources contribute URLs the tool may fetch, always in the object form.
        #   Null when not set, which allows every source.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSources, nil]
        required :url_sources, -> { Anthropic::Beta::BetaManagedAgentsWebFetchURLSources }, nil?: true

        # @!attribute allowed_domains
        #
        #   @return [Array<String>, nil]
        optional :allowed_domains, Anthropic::Internal::Type::ArrayOf[String]

        # @!attribute blocked_domains
        #
        #   @return [Array<String>, nil]
        optional :blocked_domains, Anthropic::Internal::Type::ArrayOf[String]

        # @!attribute max_content_tokens
        #
        #   @return [Integer, nil]
        optional :max_content_tokens, Integer, nil?: true

        # @!method initialize(enabled:, permission_policy:, url_sources:, allowed_domains: nil, blocked_domains: nil, max_content_tokens: nil, name: :web_fetch, type: :web_fetch)
        #   Configuration for the web_fetch tool.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsWebFetchToolConfig} for more details.
        #
        #   @param enabled [Boolean]
        #
        #   @param permission_policy [Anthropic::Models::Beta::BetaManagedAgentsAlwaysAllowPolicy, Anthropic::Models::Beta::BetaManagedAgentsAlwaysAskPolicy, Anthropic::Models::Beta::BetaManagedAgentsAutoPolicy] Permission policy for tool execution.
        #
        #   @param url_sources [Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSources, nil] Which sources contribute URLs the tool may fetch, always in the object form. Nul
        #
        #   @param allowed_domains [Array<String>]
        #
        #   @param blocked_domains [Array<String>]
        #
        #   @param max_content_tokens [Integer, nil]
        #
        #   @param name [Symbol, :web_fetch]
        #
        #   @param type [Symbol, :web_fetch]

        # Permission policy for tool execution.
        #
        # @see Anthropic::Models::Beta::BetaManagedAgentsWebFetchToolConfig#permission_policy
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
          # @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsWebFetchToolConfig::PermissionPolicy::Type, String]
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

    BetaManagedAgentsWebFetchToolConfig = Beta::BetaManagedAgentsWebFetchToolConfig
  end
end
