# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAgentToolConfigParams =
      Beta::BetaManagedAgentsAgentToolConfigParams

    module Beta
      # Configuration override for a specific tool within a toolset.
      module BetaManagedAgentsAgentToolConfigParams
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsBashToolConfigParams,
              Anthropic::Beta::BetaManagedAgentsEditToolConfigParams,
              Anthropic::Beta::BetaManagedAgentsReadToolConfigParams,
              Anthropic::Beta::BetaManagedAgentsWriteToolConfigParams,
              Anthropic::Beta::BetaManagedAgentsGlobToolConfigParams,
              Anthropic::Beta::BetaManagedAgentsGrepToolConfigParams,
              Anthropic::Beta::BetaManagedAgentsWebFetchToolConfigParams,
              Anthropic::Beta::BetaManagedAgentsWebSearchToolConfigParams
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          BASH =
            T.let(
              :bash,
              Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams::Type::TaggedSymbol
            )
          EDIT =
            T.let(
              :edit,
              Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams::Type::TaggedSymbol
            )
          READ =
            T.let(
              :read,
              Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams::Type::TaggedSymbol
            )
          WRITE =
            T.let(
              :write,
              Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams::Type::TaggedSymbol
            )
          GLOB =
            T.let(
              :glob,
              Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams::Type::TaggedSymbol
            )
          GREP =
            T.let(
              :grep,
              Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams::Type::TaggedSymbol
            )
          WEB_FETCH =
            T.let(
              :web_fetch,
              Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams::Type::TaggedSymbol
            )
          WEB_SEARCH =
            T.let(
              :web_search,
              Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams::Variants
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
            name: Symbol,
            enabled: T.nilable(T::Boolean),
            permission_policy:
              T.nilable(
                T.any(
                  Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy::OrHash,
                  Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy::OrHash
                )
              ),
            allowed_domains: T::Array[String],
            blocked_domains: T::Array[String],
            max_content_tokens: T.nilable(Integer),
            user_location:
              T.nilable(Anthropic::Beta::BetaManagedAgentsUserLocation::OrHash)
          ).returns(
            Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams::Variants
          )
        end
        def self.new(
          type:,
          # Must be "bash".
          name:,
          # Whether this tool is enabled and available to Claude. Overrides the
          # default_config setting.
          enabled: nil,
          # Permission policy for tool execution.
          permission_policy: nil,
          # Only fetch URLs whose host is one of these domains or a subdomain of one. Each
          # entry is a plain hostname like "docs.example.com" (no scheme, port, or path). At
          # most 64 entries; an empty list is rejected (omit the field instead). Cannot be
          # combined with blocked_domains.
          allowed_domains: nil,
          # Never fetch URLs whose host is one of these domains or a subdomain of one. Each
          # entry is a plain hostname like "ads.example.com" (no scheme, port, or path). At
          # most 64 entries; an empty list is rejected (omit the field instead). Cannot be
          # combined with allowed_domains.
          blocked_domains: nil,
          # Maximum number of tokens of fetched text content to include in context per call.
          # Does not apply to binary content such as PDFs.
          max_content_tokens: nil,
          # Approximate user location for search result localization.
          user_location: nil
        )
        end
      end
    end
  end
end
