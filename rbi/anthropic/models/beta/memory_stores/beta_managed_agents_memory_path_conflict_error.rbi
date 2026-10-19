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

          # The ID of the memory that blocked the write (`mem_...`), or an empty string if
          # that memory can't be identified.
          #
          # Retry the request when it is empty.
          sig { returns(T.nilable(String)) }
          attr_reader :conflicting_memory_id

          sig { params(conflicting_memory_id: String).void }
          attr_writer :conflicting_memory_id

          # The path that blocked the write: the requested path, or the path of a memory
          # that is an ancestor or descendant of it.
          sig { returns(T.nilable(String)) }
          attr_reader :conflicting_path

          sig { params(conflicting_path: String).void }
          attr_writer :conflicting_path

          # A human-readable explanation of the conflict. To handle the error in code, use
          # `conflicting_path` and `conflicting_memory_id` instead.
          sig { returns(T.nilable(String)) }
          attr_reader :message

          sig { params(message: String).void }
          attr_writer :message

          # The error returned with HTTP status 409 when you create or rename a memory and
          # the path you give is already used by another memory or overlaps another memory's
          # path.
          #
          # Two paths overlap when one is an ancestor of the other, such as `/notes` and
          # `/notes/todo.md`. To free the path, rename or delete the memory that
          # `conflicting_memory_id` references, then retry. To change that memory instead of
          # creating a new one, update it.
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
            # The ID of the memory that blocked the write (`mem_...`), or an empty string if
            # that memory can't be identified.
            #
            # Retry the request when it is empty.
            conflicting_memory_id: nil,
            # The path that blocked the write: the requested path, or the path of a memory
            # that is an ancestor or descendant of it.
            conflicting_path: nil,
            # A human-readable explanation of the conflict. To handle the error in code, use
            # `conflicting_path` and `conflicting_memory_id` instead.
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
