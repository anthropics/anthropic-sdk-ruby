# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsMemory < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig { returns(String) }
          attr_accessor :content_sha256

          sig { returns(Integer) }
          attr_accessor :content_size_bytes

          # A timestamp in RFC 3339 format
          sig { returns(Time) }
          attr_accessor :created_at

          sig { returns(String) }
          attr_accessor :memory_store_id

          sig { returns(String) }
          attr_accessor :memory_version_id

          sig { returns(String) }
          attr_accessor :path

          sig do
            returns(
              Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # A timestamp in RFC 3339 format
          sig { returns(Time) }
          attr_accessor :updated_at

          sig { returns(T.nilable(String)) }
          attr_accessor :content

          sig do
            params(
              id: String,
              content_sha256: String,
              content_size_bytes: Integer,
              created_at: Time,
              memory_store_id: String,
              memory_version_id: String,
              path: String,
              type:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory::Type::OrSymbol,
              updated_at: Time,
              content: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            id:,
            content_sha256:,
            content_size_bytes:,
            # A timestamp in RFC 3339 format
            created_at:,
            memory_store_id:,
            memory_version_id:,
            path:,
            type:,
            # A timestamp in RFC 3339 format
            updated_at:,
            content: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                content_sha256: String,
                content_size_bytes: Integer,
                created_at: Time,
                memory_store_id: String,
                memory_version_id: String,
                path: String,
                type:
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory::Type::TaggedSymbol,
                updated_at: Time,
                content: T.nilable(String)
              }
            )
          end
          def to_hash
          end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MEMORY =
              T.let(
                :memory,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory::Type::TaggedSymbol
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
end
