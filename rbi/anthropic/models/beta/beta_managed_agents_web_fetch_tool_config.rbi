# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsWebFetchToolConfig =
      Beta::BetaManagedAgentsWebFetchToolConfig

    module Beta
      class BetaManagedAgentsWebFetchToolConfig < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsWebFetchToolConfig,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(T::Boolean) }
        attr_accessor :enabled

        sig { returns(Symbol) }
        attr_accessor :name

        # Permission policy for tool execution.
        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsWebFetchToolConfig::PermissionPolicy::Variants
          )
        end
        attr_accessor :permission_policy

        sig { returns(Symbol) }
        attr_accessor :type

        # Which sources contribute URLs the tool may fetch, always in the object form.
        # Null when not set, which allows every source.
        sig do
          returns(
            T.nilable(Anthropic::Beta::BetaManagedAgentsWebFetchURLSources)
          )
        end
        attr_reader :url_sources

        sig do
          params(
            url_sources:
              T.nilable(
                Anthropic::Beta::BetaManagedAgentsWebFetchURLSources::OrHash
              )
          ).void
        end
        attr_writer :url_sources

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :allowed_domains

        sig { params(allowed_domains: T::Array[String]).void }
        attr_writer :allowed_domains

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :blocked_domains

        sig { params(blocked_domains: T::Array[String]).void }
        attr_writer :blocked_domains

        sig { returns(T.nilable(Integer)) }
        attr_accessor :max_content_tokens

        # Configuration for the web_fetch tool.
        sig do
          params(
            enabled: T::Boolean,
            permission_policy:
              T.any(
                Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy::OrHash,
                Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy::OrHash,
                Anthropic::Beta::BetaManagedAgentsAutoPolicy::OrHash
              ),
            url_sources:
              T.nilable(
                Anthropic::Beta::BetaManagedAgentsWebFetchURLSources::OrHash
              ),
            allowed_domains: T::Array[String],
            blocked_domains: T::Array[String],
            max_content_tokens: T.nilable(Integer),
            name: Symbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          enabled:,
          # Permission policy for tool execution.
          permission_policy:,
          # Which sources contribute URLs the tool may fetch, always in the object form.
          # Null when not set, which allows every source.
          url_sources:,
          allowed_domains: nil,
          blocked_domains: nil,
          max_content_tokens: nil,
          name: :web_fetch,
          type: :web_fetch
        )
        end

        sig do
          override.returns(
            {
              enabled: T::Boolean,
              name: Symbol,
              permission_policy:
                Anthropic::Beta::BetaManagedAgentsWebFetchToolConfig::PermissionPolicy::Variants,
              type: Symbol,
              url_sources:
                T.nilable(Anthropic::Beta::BetaManagedAgentsWebFetchURLSources),
              allowed_domains: T::Array[String],
              blocked_domains: T::Array[String],
              max_content_tokens: T.nilable(Integer)
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
                Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy,
                Anthropic::Beta::BetaManagedAgentsAutoPolicy
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::BetaManagedAgentsWebFetchToolConfig::PermissionPolicy::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ALWAYS_ALLOW =
              T.let(
                :always_allow,
                Anthropic::Beta::BetaManagedAgentsWebFetchToolConfig::PermissionPolicy::Type::TaggedSymbol
              )
            ALWAYS_ASK =
              T.let(
                :always_ask,
                Anthropic::Beta::BetaManagedAgentsWebFetchToolConfig::PermissionPolicy::Type::TaggedSymbol
              )
            AUTO =
              T.let(
                :auto,
                Anthropic::Beta::BetaManagedAgentsWebFetchToolConfig::PermissionPolicy::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::BetaManagedAgentsWebFetchToolConfig::PermissionPolicy::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsWebFetchToolConfig::PermissionPolicy::Variants
              ]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type:
                Anthropic::Beta::BetaManagedAgentsWebFetchToolConfig::PermissionPolicy::Type::OrSymbol
            ).returns(
              Anthropic::Beta::BetaManagedAgentsWebFetchToolConfig::PermissionPolicy::Variants
            )
          end
          def self.new(type:)
          end
        end
      end
    end
  end
end
