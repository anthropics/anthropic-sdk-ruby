# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsWebSearchToolConfigParams =
      Beta::BetaManagedAgentsWebSearchToolConfigParams

    module Beta
      class BetaManagedAgentsWebSearchToolConfigParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsWebSearchToolConfigParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Must be "web_search".
        sig { returns(Symbol) }
        attr_accessor :name

        # Only return search results whose host is one of these domains or a subdomain of
        # one. Each entry is a plain hostname like "docs.example.com" (no scheme or port;
        # an optional path suffix is accepted). At most 64 entries; an empty list is
        # rejected (omit the field instead). Cannot be combined with blocked_domains.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :allowed_domains

        sig { params(allowed_domains: T::Array[String]).void }
        attr_writer :allowed_domains

        # Never return search results whose host is one of these domains or a subdomain of
        # one. Each entry is a plain hostname like "ads.example.com" (no scheme or port;
        # an optional path suffix is accepted). At most 64 entries; an empty list is
        # rejected (omit the field instead). Cannot be combined with allowed_domains.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :blocked_domains

        sig { params(blocked_domains: T::Array[String]).void }
        attr_writer :blocked_domains

        # Whether this tool is enabled and available to Claude. Overrides the
        # default_config setting.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :enabled

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
              Anthropic::Beta::BetaManagedAgentsWebSearchToolConfigParams::Type::OrSymbol
            )
          )
        end
        attr_reader :type

        sig do
          params(
            type:
              Anthropic::Beta::BetaManagedAgentsWebSearchToolConfigParams::Type::OrSymbol
          ).void
        end
        attr_writer :type

        # Approximate user location for search result localization.
        sig do
          returns(T.nilable(Anthropic::Beta::BetaManagedAgentsUserLocation))
        end
        attr_reader :user_location

        sig do
          params(
            user_location:
              T.nilable(Anthropic::Beta::BetaManagedAgentsUserLocation::OrHash)
          ).void
        end
        attr_writer :user_location

        # Configuration override for the web_search tool.
        sig do
          params(
            allowed_domains: T::Array[String],
            blocked_domains: T::Array[String],
            enabled: T.nilable(T::Boolean),
            permission_policy:
              T.nilable(
                T.any(
                  Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy::OrHash,
                  Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy::OrHash
                )
              ),
            type:
              Anthropic::Beta::BetaManagedAgentsWebSearchToolConfigParams::Type::OrSymbol,
            user_location:
              T.nilable(Anthropic::Beta::BetaManagedAgentsUserLocation::OrHash),
            name: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Only return search results whose host is one of these domains or a subdomain of
          # one. Each entry is a plain hostname like "docs.example.com" (no scheme or port;
          # an optional path suffix is accepted). At most 64 entries; an empty list is
          # rejected (omit the field instead). Cannot be combined with blocked_domains.
          allowed_domains: nil,
          # Never return search results whose host is one of these domains or a subdomain of
          # one. Each entry is a plain hostname like "ads.example.com" (no scheme or port;
          # an optional path suffix is accepted). At most 64 entries; an empty list is
          # rejected (omit the field instead). Cannot be combined with allowed_domains.
          blocked_domains: nil,
          # Whether this tool is enabled and available to Claude. Overrides the
          # default_config setting.
          enabled: nil,
          # Permission policy for tool execution.
          permission_policy: nil,
          type: nil,
          # Approximate user location for search result localization.
          user_location: nil,
          # Must be "web_search".
          name: :web_search
        )
        end

        sig do
          override.returns(
            {
              name: Symbol,
              allowed_domains: T::Array[String],
              blocked_domains: T::Array[String],
              enabled: T.nilable(T::Boolean),
              permission_policy:
                T.nilable(
                  T.any(
                    Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy,
                    Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy
                  )
                ),
              type:
                Anthropic::Beta::BetaManagedAgentsWebSearchToolConfigParams::Type::OrSymbol,
              user_location:
                T.nilable(Anthropic::Beta::BetaManagedAgentsUserLocation)
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
                  Anthropic::Beta::BetaManagedAgentsWebSearchToolConfigParams::PermissionPolicy::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ALWAYS_ALLOW =
              T.let(
                :always_allow,
                Anthropic::Beta::BetaManagedAgentsWebSearchToolConfigParams::PermissionPolicy::Type::TaggedSymbol
              )
            ALWAYS_ASK =
              T.let(
                :always_ask,
                Anthropic::Beta::BetaManagedAgentsWebSearchToolConfigParams::PermissionPolicy::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::BetaManagedAgentsWebSearchToolConfigParams::PermissionPolicy::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsWebSearchToolConfigParams::PermissionPolicy::Variants
              ]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(type: T.any(Symbol, String)).returns(
              Anthropic::Beta::BetaManagedAgentsWebSearchToolConfigParams::PermissionPolicy::Variants
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
                Anthropic::Beta::BetaManagedAgentsWebSearchToolConfigParams::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          WEB_SEARCH =
            T.let(
              :web_search,
              Anthropic::Beta::BetaManagedAgentsWebSearchToolConfigParams::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsWebSearchToolConfigParams::Type::TaggedSymbol
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
