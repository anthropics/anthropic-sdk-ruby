# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Configuration for a specific agent tool.
      module BetaManagedAgentsAgentToolConfig
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # Configuration for the bash tool.
        variant :bash, -> { Anthropic::Beta::BetaManagedAgentsBashToolConfig }

        # Configuration for the edit tool.
        variant :edit, -> { Anthropic::Beta::BetaManagedAgentsEditToolConfig }

        # Configuration for the read tool.
        variant :read, -> { Anthropic::Beta::BetaManagedAgentsReadToolConfig }

        # Configuration for the write tool.
        variant :write, -> { Anthropic::Beta::BetaManagedAgentsWriteToolConfig }

        # Configuration for the glob tool.
        variant :glob, -> { Anthropic::Beta::BetaManagedAgentsGlobToolConfig }

        # Configuration for the grep tool.
        variant :grep, -> { Anthropic::Beta::BetaManagedAgentsGrepToolConfig }

        # Configuration for the web_fetch tool.
        variant :web_fetch, -> { Anthropic::Beta::BetaManagedAgentsWebFetchToolConfig }

        # Configuration for the web_search tool.
        variant :web_search, -> { Anthropic::Beta::BetaManagedAgentsWebSearchToolConfig }

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
        #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsBashToolConfig, Anthropic::Models::Beta::BetaManagedAgentsEditToolConfig, Anthropic::Models::Beta::BetaManagedAgentsReadToolConfig, Anthropic::Models::Beta::BetaManagedAgentsWriteToolConfig, Anthropic::Models::Beta::BetaManagedAgentsGlobToolConfig, Anthropic::Models::Beta::BetaManagedAgentsGrepToolConfig, Anthropic::Models::Beta::BetaManagedAgentsWebFetchToolConfig, Anthropic::Models::Beta::BetaManagedAgentsWebSearchToolConfig)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # @param type [Symbol, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [Boolean] :enabled
        #
        #   @option args [Anthropic::Models::Beta::BetaManagedAgentsAlwaysAllowPolicy, Anthropic::Models::Beta::BetaManagedAgentsAlwaysAskPolicy] :permission_policy Permission policy for tool execution.
        #
        #   @option args [Symbol, :bash, Symbol, :edit, Symbol, :read, Symbol, :write, Symbol, :glob, Symbol, :grep, Symbol, :web_fetch, Symbol, :web_search] :name
        #
        #   @option args [Array<String>] :allowed_domains
        #
        #   @option args [Array<String>] :blocked_domains
        #
        #   @option args [Integer, nil] :max_content_tokens
        #
        #   @option args [Anthropic::Models::Beta::BetaManagedAgentsUserLocation, nil] :user_location Approximate user location for search result localization.
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaManagedAgentsBashToolConfig, Anthropic::Models::Beta::BetaManagedAgentsEditToolConfig, Anthropic::Models::Beta::BetaManagedAgentsReadToolConfig, Anthropic::Models::Beta::BetaManagedAgentsWriteToolConfig, Anthropic::Models::Beta::BetaManagedAgentsGlobToolConfig, Anthropic::Models::Beta::BetaManagedAgentsGrepToolConfig, Anthropic::Models::Beta::BetaManagedAgentsWebFetchToolConfig, Anthropic::Models::Beta::BetaManagedAgentsWebSearchToolConfig]
        def self.new(type:, **args)
          case type.to_sym
          when :bash
            Anthropic::Beta::BetaManagedAgentsBashToolConfig.new(**args)
          when :edit
            Anthropic::Beta::BetaManagedAgentsEditToolConfig.new(**args)
          when :read
            Anthropic::Beta::BetaManagedAgentsReadToolConfig.new(**args)
          when :write
            Anthropic::Beta::BetaManagedAgentsWriteToolConfig.new(**args)
          when :glob
            Anthropic::Beta::BetaManagedAgentsGlobToolConfig.new(**args)
          when :grep
            Anthropic::Beta::BetaManagedAgentsGrepToolConfig.new(**args)
          when :web_fetch
            Anthropic::Beta::BetaManagedAgentsWebFetchToolConfig.new(**args)
          when :web_search
            Anthropic::Beta::BetaManagedAgentsWebSearchToolConfig.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaManagedAgentsAgentToolConfig = Beta::BetaManagedAgentsAgentToolConfig
  end
end
