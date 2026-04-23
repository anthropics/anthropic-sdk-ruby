# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsMemoryVersion < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersion,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          # A timestamp in RFC 3339 format
          sig { returns(Time) }
          attr_accessor :created_at

          sig { returns(String) }
          attr_accessor :memory_id

          sig { returns(String) }
          attr_accessor :memory_store_id

          # MemoryVersionOperation enum
          sig do
            returns(
              Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation::TaggedSymbol
            )
          end
          attr_accessor :operation

          sig do
            returns(
              Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersion::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          sig { returns(T.nilable(String)) }
          attr_accessor :content

          sig { returns(T.nilable(String)) }
          attr_accessor :content_sha256

          sig { returns(T.nilable(Integer)) }
          attr_accessor :content_size_bytes

          sig do
            returns(
              T.nilable(
                Anthropic::Beta::MemoryStores::BetaManagedAgentsActor::Variants
              )
            )
          end
          attr_reader :created_by

          sig do
            params(
              created_by:
                T.any(
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsSessionActor::OrHash,
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsAPIActor::OrHash,
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsUserActor::OrHash
                )
            ).void
          end
          attr_writer :created_by

          sig { returns(T.nilable(String)) }
          attr_accessor :path

          # A timestamp in RFC 3339 format
          sig { returns(T.nilable(Time)) }
          attr_accessor :redacted_at

          sig do
            returns(
              T.nilable(
                Anthropic::Beta::MemoryStores::BetaManagedAgentsActor::Variants
              )
            )
          end
          attr_reader :redacted_by

          sig do
            params(
              redacted_by:
                T.any(
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsSessionActor::OrHash,
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsAPIActor::OrHash,
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsUserActor::OrHash
                )
            ).void
          end
          attr_writer :redacted_by

          sig do
            params(
              id: String,
              created_at: Time,
              memory_id: String,
              memory_store_id: String,
              operation:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation::OrSymbol,
              type:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersion::Type::OrSymbol,
              content: T.nilable(String),
              content_sha256: T.nilable(String),
              content_size_bytes: T.nilable(Integer),
              created_by:
                T.any(
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsSessionActor::OrHash,
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsAPIActor::OrHash,
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsUserActor::OrHash
                ),
              path: T.nilable(String),
              redacted_at: T.nilable(Time),
              redacted_by:
                T.any(
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsSessionActor::OrHash,
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsAPIActor::OrHash,
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsUserActor::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            id:,
            # A timestamp in RFC 3339 format
            created_at:,
            memory_id:,
            memory_store_id:,
            # MemoryVersionOperation enum
            operation:,
            type:,
            content: nil,
            content_sha256: nil,
            content_size_bytes: nil,
            created_by: nil,
            path: nil,
            # A timestamp in RFC 3339 format
            redacted_at: nil,
            redacted_by: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                created_at: Time,
                memory_id: String,
                memory_store_id: String,
                operation:
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation::TaggedSymbol,
                type:
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersion::Type::TaggedSymbol,
                content: T.nilable(String),
                content_sha256: T.nilable(String),
                content_size_bytes: T.nilable(Integer),
                created_by:
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsActor::Variants,
                path: T.nilable(String),
                redacted_at: T.nilable(Time),
                redacted_by:
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsActor::Variants
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
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersion::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MEMORY_VERSION =
              T.let(
                :memory_version,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersion::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersion::Type::TaggedSymbol
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
