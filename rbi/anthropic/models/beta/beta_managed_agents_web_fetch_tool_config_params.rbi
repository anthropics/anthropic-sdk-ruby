# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsWebFetchToolConfigParams =
      Beta::BetaManagedAgentsWebFetchToolConfigParams

    module Beta
      class BetaManagedAgentsWebFetchToolConfigParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsWebFetchToolConfigParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Must be "web_fetch".
        sig { returns(Symbol) }
        attr_accessor :name

        # Only fetch URLs whose host is one of these domains or a subdomain of one. Each
        # entry is a plain hostname like "docs.example.com" (no scheme, port, or path). At
        # most 64 entries; an empty list is rejected (omit the field instead). Cannot be
        # combined with blocked_domains.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :allowed_domains

        sig { params(allowed_domains: T::Array[String]).void }
        attr_writer :allowed_domains

        # Never fetch URLs whose host is one of these domains or a subdomain of one. Each
        # entry is a plain hostname like "ads.example.com" (no scheme, port, or path). At
        # most 64 entries; an empty list is rejected (omit the field instead). Cannot be
        # combined with allowed_domains.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :blocked_domains

        sig { params(blocked_domains: T::Array[String]).void }
        attr_writer :blocked_domains

        # Whether this tool is enabled and available to Claude. Overrides the
        # default_config setting.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :enabled

        # Maximum number of tokens of fetched text content to include in context per call.
        # Does not apply to binary content such as PDFs.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :max_content_tokens

        # Permission policy for tool execution.
        sig do
          returns(
            T.nilable(
              T.any(
                Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy,
                Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy
              )
            )
          )
        end
        attr_accessor :permission_policy

        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaManagedAgentsWebFetchToolConfigParams::Type::OrSymbol
            )
          )
        end
        attr_reader :type

        sig do
          params(
            type:
              Anthropic::Beta::BetaManagedAgentsWebFetchToolConfigParams::Type::OrSymbol
          ).void
        end
        attr_writer :type

        # Configuration override for the web_fetch tool.
        sig do
          params(
            allowed_domains: T::Array[String],
            blocked_domains: T::Array[String],
            enabled: T.nilable(T::Boolean),
            max_content_tokens: T.nilable(Integer),
            permission_policy:
              T.nilable(
                T.any(
                  Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy::OrHash,
                  Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy::OrHash
                )
              ),
            type:
              Anthropic::Beta::BetaManagedAgentsWebFetchToolConfigParams::Type::OrSymbol,
            name: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
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
          # Whether this tool is enabled and available to Claude. Overrides the
          # default_config setting.
          enabled: nil,
          # Maximum number of tokens of fetched text content to include in context per call.
          # Does not apply to binary content such as PDFs.
          max_content_tokens: nil,
          # Permission policy for tool execution.
          permission_policy: nil,
          type: nil,
          # Must be "web_fetch".
          name: :web_fetch
        )
        end

        sig do
          override.returns(
            {
              name: Symbol,
              allowed_domains: T::Array[String],
              blocked_domains: T::Array[String],
              enabled: T.nilable(T::Boolean),
              max_content_tokens: T.nilable(Integer),
              permission_policy:
                T.nilable(
                  T.any(
                    Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy,
                    Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy
                  )
                ),
              type:
                Anthropic::Beta::BetaManagedAgentsWebFetchToolConfigParams::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        # Permission policy for tool execution.
        module PermissionPolicy
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy,
                Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::BetaManagedAgentsWebFetchToolConfigParams::PermissionPolicy::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ALWAYS_ALLOW =
              T.let(
                :always_allow,
                Anthropic::Beta::BetaManagedAgentsWebFetchToolConfigParams::PermissionPolicy::Type::TaggedSymbol
              )
            ALWAYS_ASK =
              T.let(
                :always_ask,
                Anthropic::Beta::BetaManagedAgentsWebFetchToolConfigParams::PermissionPolicy::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::BetaManagedAgentsWebFetchToolConfigParams::PermissionPolicy::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsWebFetchToolConfigParams::PermissionPolicy::Variants
              ]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(type: T.any(Symbol, String)).returns(
              Anthropic::Beta::BetaManagedAgentsWebFetchToolConfigParams::PermissionPolicy::Variants
            )
          end
          def self.new(type:)
          end
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsWebFetchToolConfigParams::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          WEB_FETCH =
            T.let(
              :web_fetch,
              Anthropic::Beta::BetaManagedAgentsWebFetchToolConfigParams::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsWebFetchToolConfigParams::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
