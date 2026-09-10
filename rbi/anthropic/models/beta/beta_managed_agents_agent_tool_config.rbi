# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAgentToolConfig = Beta::BetaManagedAgentsAgentToolConfig

    module Beta
      # Configuration for a specific agent tool.
      module BetaManagedAgentsAgentToolConfig
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsBashToolConfig,
              Anthropic::Beta::BetaManagedAgentsEditToolConfig,
              Anthropic::Beta::BetaManagedAgentsReadToolConfig,
              Anthropic::Beta::BetaManagedAgentsWriteToolConfig,
              Anthropic::Beta::BetaManagedAgentsGlobToolConfig,
              Anthropic::Beta::BetaManagedAgentsGrepToolConfig,
              Anthropic::Beta::BetaManagedAgentsWebFetchToolConfig,
              Anthropic::Beta::BetaManagedAgentsWebSearchToolConfig
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsAgentToolConfig::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          BASH =
            T.let(
              :bash,
              Anthropic::Beta::BetaManagedAgentsAgentToolConfig::Type::TaggedSymbol
            )
          EDIT =
            T.let(
              :edit,
              Anthropic::Beta::BetaManagedAgentsAgentToolConfig::Type::TaggedSymbol
            )
          READ =
            T.let(
              :read,
              Anthropic::Beta::BetaManagedAgentsAgentToolConfig::Type::TaggedSymbol
            )
          WRITE =
            T.let(
              :write,
              Anthropic::Beta::BetaManagedAgentsAgentToolConfig::Type::TaggedSymbol
            )
          GLOB =
            T.let(
              :glob,
              Anthropic::Beta::BetaManagedAgentsAgentToolConfig::Type::TaggedSymbol
            )
          GREP =
            T.let(
              :grep,
              Anthropic::Beta::BetaManagedAgentsAgentToolConfig::Type::TaggedSymbol
            )
          WEB_FETCH =
            T.let(
              :web_fetch,
              Anthropic::Beta::BetaManagedAgentsAgentToolConfig::Type::TaggedSymbol
            )
          WEB_SEARCH =
            T.let(
              :web_search,
              Anthropic::Beta::BetaManagedAgentsAgentToolConfig::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsAgentToolConfig::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsAgentToolConfig::Variants
            ]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type: T.any(Symbol, String),
            enabled: T::Boolean,
            permission_policy:
              T.any(
                Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy::OrHash,
                Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy::OrHash
              ),
            name: Symbol,
            allowed_domains: T::Array[String],
            blocked_domains: T::Array[String],
            max_content_tokens: T.nilable(Integer),
            user_location:
              T.nilable(Anthropic::Beta::BetaManagedAgentsUserLocation::OrHash)
          ).returns(Anthropic::Beta::BetaManagedAgentsAgentToolConfig::Variants)
        end
        def self.new(
          type:,
          enabled:,
          # Permission policy for tool execution.
          permission_policy:,
          name:,
          allowed_domains: nil,
          blocked_domains: nil,
          max_content_tokens: nil,
          # Approximate user location for search result localization.
          user_location: nil
        )
        end
      end
    end
  end
end
