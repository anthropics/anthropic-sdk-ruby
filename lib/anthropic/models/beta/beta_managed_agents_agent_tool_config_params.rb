# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Configuration override for a specific tool within a toolset.
      module BetaManagedAgentsAgentToolConfigParams
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # Configuration override for the bash tool.
        variant :bash, -> { Anthropic::Beta::BetaManagedAgentsBashToolConfigParams }

        # Configuration override for the edit tool.
        variant :edit, -> { Anthropic::Beta::BetaManagedAgentsEditToolConfigParams }

        # Configuration override for the read tool.
        variant :read, -> { Anthropic::Beta::BetaManagedAgentsReadToolConfigParams }

        # Configuration override for the write tool.
        variant :write, -> { Anthropic::Beta::BetaManagedAgentsWriteToolConfigParams }

        # Configuration override for the glob tool.
        variant :glob, -> { Anthropic::Beta::BetaManagedAgentsGlobToolConfigParams }

        # Configuration override for the grep tool.
        variant :grep, -> { Anthropic::Beta::BetaManagedAgentsGrepToolConfigParams }

        # Configuration override for the web_fetch tool.
        variant :web_fetch, -> { Anthropic::Beta::BetaManagedAgentsWebFetchToolConfigParams }

        # Configuration override for the web_search tool.
        variant :web_search, -> { Anthropic::Beta::BetaManagedAgentsWebSearchToolConfigParams }

        module Type
          extend Anthropic::Internal::Type::Enum

          BASH = :bash
          EDIT = :edit
          READ = :read
          WRITE = :write
          GLOB = :glob
          GREP = :grep
          WEB_FETCH = :web_fetch
          WEB_SEARCH = :web_search

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsBashToolConfigParams, Anthropic::Models::Beta::BetaManagedAgentsEditToolConfigParams, Anthropic::Models::Beta::BetaManagedAgentsReadToolConfigParams, Anthropic::Models::Beta::BetaManagedAgentsWriteToolConfigParams, Anthropic::Models::Beta::BetaManagedAgentsGlobToolConfigParams, Anthropic::Models::Beta::BetaManagedAgentsGrepToolConfigParams, Anthropic::Models::Beta::BetaManagedAgentsWebFetchToolConfigParams, Anthropic::Models::Beta::BetaManagedAgentsWebSearchToolConfigParams)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::BetaManagedAgentsAgentToolConfigParams} for more
        # details.
        #
        # @param type [Symbol, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [Boolean, nil] :enabled Whether this tool is enabled and available to Claude. Overrides the default_conf
        #
        #   @option args [Anthropic::Models::Beta::BetaManagedAgentsAlwaysAllowPolicy, Anthropic::Models::Beta::BetaManagedAgentsAlwaysAskPolicy, nil] :permission_policy Permission policy for tool execution.
        #
        #   @option args [Symbol, :bash, Symbol, :edit, Symbol, :read, Symbol, :write, Symbol, :glob, Symbol, :grep, Symbol, :web_fetch, Symbol, :web_search] :name Must be "bash".
        #
        #   @option args [Array<String>] :allowed_domains Only fetch URLs whose host is one of these domains or a subdomain of one. Each e
        #
        #   @option args [Array<String>] :blocked_domains Never fetch URLs whose host is one of these domains or a subdomain of one. Each
        #
        #   @option args [Integer, nil] :max_content_tokens Maximum number of tokens of fetched text content to include in context per call.
        #
        #   @option args [Anthropic::Models::Beta::BetaManagedAgentsUserLocation, nil] :user_location Approximate user location for search result localization.
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaManagedAgentsBashToolConfigParams, Anthropic::Models::Beta::BetaManagedAgentsEditToolConfigParams, Anthropic::Models::Beta::BetaManagedAgentsReadToolConfigParams, Anthropic::Models::Beta::BetaManagedAgentsWriteToolConfigParams, Anthropic::Models::Beta::BetaManagedAgentsGlobToolConfigParams, Anthropic::Models::Beta::BetaManagedAgentsGrepToolConfigParams, Anthropic::Models::Beta::BetaManagedAgentsWebFetchToolConfigParams, Anthropic::Models::Beta::BetaManagedAgentsWebSearchToolConfigParams]
        def self.new(type:, **args)
          case type.to_sym
          when :bash
            Anthropic::Beta::BetaManagedAgentsBashToolConfigParams.new(**args)
          when :edit
            Anthropic::Beta::BetaManagedAgentsEditToolConfigParams.new(**args)
          when :read
            Anthropic::Beta::BetaManagedAgentsReadToolConfigParams.new(**args)
          when :write
            Anthropic::Beta::BetaManagedAgentsWriteToolConfigParams.new(**args)
          when :glob
            Anthropic::Beta::BetaManagedAgentsGlobToolConfigParams.new(**args)
          when :grep
            Anthropic::Beta::BetaManagedAgentsGrepToolConfigParams.new(**args)
          when :web_fetch
            Anthropic::Beta::BetaManagedAgentsWebFetchToolConfigParams.new(**args)
          when :web_search
            Anthropic::Beta::BetaManagedAgentsWebSearchToolConfigParams.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaManagedAgentsAgentToolConfigParams = Beta::BetaManagedAgentsAgentToolConfigParams
  end
end
