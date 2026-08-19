# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsWebSearchToolConfig =
      Beta::BetaManagedAgentsWebSearchToolConfig

    module Beta
      class BetaManagedAgentsWebSearchToolConfig < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsWebSearchToolConfig,
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
            Anthropic::Beta::BetaManagedAgentsWebSearchToolConfig::PermissionPolicy::Variants
          )
        end
        attr_accessor :permission_policy

        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :allowed_domains

        sig { params(allowed_domains: T::Array[String]).void }
        attr_writer :allowed_domains

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :blocked_domains

        sig { params(blocked_domains: T::Array[String]).void }
        attr_writer :blocked_domains

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

        # Configuration for the web_search tool.
        sig do
          params(
            enabled: T::Boolean,
            permission_policy:
              T.any(
                Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy::OrHash,
                Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy::OrHash
              ),
            allowed_domains: T::Array[String],
            blocked_domains: T::Array[String],
            user_location:
              T.nilable(Anthropic::Beta::BetaManagedAgentsUserLocation::OrHash),
            name: Symbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          enabled:,
          # Permission policy for tool execution.
          permission_policy:,
          allowed_domains: nil,
          blocked_domains: nil,
          # Approximate user location for search result localization.
          user_location: nil,
          name: :web_search,
          type: :web_search
        )
        end

        sig do
          override.returns(
            {
              enabled: T::Boolean,
              name: Symbol,
              permission_policy:
                Anthropic::Beta::BetaManagedAgentsWebSearchToolConfig::PermissionPolicy::Variants,
              type: Symbol,
              allowed_domains: T::Array[String],
              blocked_domains: T::Array[String],
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

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsWebSearchToolConfig::PermissionPolicy::Variants
              ]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(type: T.any(Symbol, String)).returns(
              Anthropic::Beta::BetaManagedAgentsWebSearchToolConfig::PermissionPolicy::Variants
            )
          end
          def self.new(type:)
          end
        end
      end
    end
  end
end
