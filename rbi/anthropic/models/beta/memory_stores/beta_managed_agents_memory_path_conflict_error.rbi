# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsMemoryPathConflictError < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPathConflictError,
                Anthropic::Internal::AnyHash
              )
            end

          sig do
            returns(
              Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPathConflictError::Type::OrSymbol
            )
          end
          attr_accessor :type

          sig { returns(T.nilable(String)) }
          attr_reader :conflicting_memory_id

          sig { params(conflicting_memory_id: String).void }
          attr_writer :conflicting_memory_id

          sig { returns(T.nilable(String)) }
          attr_reader :conflicting_path

          sig { params(conflicting_path: String).void }
          attr_writer :conflicting_path

          sig { returns(T.nilable(String)) }
          attr_reader :message

          sig { params(message: String).void }
          attr_writer :message

          sig do
            params(
              type:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPathConflictError::Type::OrSymbol,
              conflicting_memory_id: String,
              conflicting_path: String,
              message: String
            ).returns(T.attached_class)
          end
          def self.new(
            type:,
            conflicting_memory_id: nil,
            conflicting_path: nil,
            message: nil
          )
          end

          sig do
            override.returns(
              {
                type:
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPathConflictError::Type::OrSymbol,
                conflicting_memory_id: String,
                conflicting_path: String,
                message: String
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
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPathConflictError::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MEMORY_PATH_CONFLICT_ERROR =
              T.let(
                :memory_path_conflict_error,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPathConflictError::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPathConflictError::Type::TaggedSymbol
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
