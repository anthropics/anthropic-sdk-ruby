# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMemoryStore = Beta::BetaManagedAgentsMemoryStore

    module Beta
      class BetaManagedAgentsMemoryStore < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMemoryStore,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        # A timestamp in RFC 3339 format
        sig { returns(Time) }
        attr_accessor :created_at

        sig { returns(String) }
        attr_accessor :name

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsMemoryStore::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # A timestamp in RFC 3339 format
        sig { returns(Time) }
        attr_accessor :updated_at

        # A timestamp in RFC 3339 format
        sig { returns(T.nilable(Time)) }
        attr_accessor :archived_at

        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_reader :metadata

        sig { params(metadata: T::Hash[Symbol, String]).void }
        attr_writer :metadata

        sig do
          params(
            id: String,
            created_at: Time,
            name: String,
            type: Anthropic::Beta::BetaManagedAgentsMemoryStore::Type::OrSymbol,
            updated_at: Time,
            archived_at: T.nilable(Time),
            description: String,
            metadata: T::Hash[Symbol, String]
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          # A timestamp in RFC 3339 format
          created_at:,
          name:,
          type:,
          # A timestamp in RFC 3339 format
          updated_at:,
          # A timestamp in RFC 3339 format
          archived_at: nil,
          description: nil,
          metadata: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              created_at: Time,
              name: String,
              type:
                Anthropic::Beta::BetaManagedAgentsMemoryStore::Type::TaggedSymbol,
              updated_at: Time,
              archived_at: T.nilable(Time),
              description: String,
              metadata: T::Hash[Symbol, String]
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaManagedAgentsMemoryStore::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MEMORY_STORE =
            T.let(
              :memory_store,
              Anthropic::Beta::BetaManagedAgentsMemoryStore::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsMemoryStore::Type::TaggedSymbol
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
