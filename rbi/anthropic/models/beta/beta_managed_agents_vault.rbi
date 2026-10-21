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

        # The unique ID of the vault (`vlt_...`).
        sig { returns(String) }
        attr_accessor :id

        # When the vault was archived. Null if not archived.
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

        sig { returns(Symbol) }
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
            updated_at: Time,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The unique ID of the vault (`vlt_...`).
          id:,
          # When the vault was archived. Null if not archived.
          archived_at:,
          # A timestamp in RFC 3339 format
          created_at:,
          # Human-readable name for the vault.
          display_name:,
          # Arbitrary key-value metadata attached to the vault.
          metadata:,
          # A timestamp in RFC 3339 format
          updated_at:,
          type: :vault
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
              type: Symbol,
              updated_at: Time
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
