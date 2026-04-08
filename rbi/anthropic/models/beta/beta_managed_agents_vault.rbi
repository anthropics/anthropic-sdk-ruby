# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsVault = Beta::BetaManagedAgentsVault

    module Beta
      class BetaManagedAgentsVault < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsVault,
              Anthropic::Internal::AnyHash
            )
          end

        # Unique identifier for the vault.
        sig { returns(String) }
        attr_accessor :id

        # A timestamp in RFC 3339 format
        sig { returns(T.nilable(Time)) }
        attr_accessor :archived_at

        # A timestamp in RFC 3339 format
        sig { returns(Time) }
        attr_accessor :created_at

        # Human-readable name for the vault.
        sig { returns(String) }
        attr_accessor :display_name

        # Arbitrary key-value metadata attached to the vault.
        sig { returns(T::Hash[Symbol, String]) }
        attr_accessor :metadata

        sig do
          returns(Anthropic::Beta::BetaManagedAgentsVault::Type::TaggedSymbol)
        end
        attr_accessor :type

        # A timestamp in RFC 3339 format
        sig { returns(Time) }
        attr_accessor :updated_at

        # A vault that stores credentials for use by agents during sessions.
        sig do
          params(
            id: String,
            archived_at: T.nilable(Time),
            created_at: Time,
            display_name: String,
            metadata: T::Hash[Symbol, String],
            type: Anthropic::Beta::BetaManagedAgentsVault::Type::OrSymbol,
            updated_at: Time
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique identifier for the vault.
          id:,
          # A timestamp in RFC 3339 format
          archived_at:,
          # A timestamp in RFC 3339 format
          created_at:,
          # Human-readable name for the vault.
          display_name:,
          # Arbitrary key-value metadata attached to the vault.
          metadata:,
          type:,
          # A timestamp in RFC 3339 format
          updated_at:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              archived_at: T.nilable(Time),
              created_at: Time,
              display_name: String,
              metadata: T::Hash[Symbol, String],
              type: Anthropic::Beta::BetaManagedAgentsVault::Type::TaggedSymbol,
              updated_at: Time
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaManagedAgentsVault::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          VAULT =
            T.let(
              :vault,
              Anthropic::Beta::BetaManagedAgentsVault::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsVault::Type::TaggedSymbol
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
