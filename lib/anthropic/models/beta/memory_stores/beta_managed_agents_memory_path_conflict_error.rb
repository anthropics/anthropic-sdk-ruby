# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsMemoryPathConflictError < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryPathConflictError::Type]
          required :type, enum: -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPathConflictError::Type }

          # @!attribute conflicting_memory_id
          #   The ID of the memory that blocked the write (`mem_...`), or an empty string if
          #   that memory can't be identified.
          #
          #   Retry the request when it is empty.
          #
          #   @return [String, nil]
          optional :conflicting_memory_id, String

          # @!attribute conflicting_path
          #   The path that blocked the write: the requested path, or the path of a memory
          #   that is an ancestor or descendant of it.
          #
          #   @return [String, nil]
          optional :conflicting_path, String

          # @!attribute message
          #   A human-readable explanation of the conflict. To handle the error in code, use
          #   `conflicting_path` and `conflicting_memory_id` instead.
          #
          #   @return [String, nil]
          optional :message, String

          # @!method initialize(type:, conflicting_memory_id: nil, conflicting_path: nil, message: nil)
          #   The error returned with HTTP status 409 when you create or rename a memory and
          #   the path you give is already used by another memory or overlaps another memory's
          #   path.
          #
          #   Two paths overlap when one is an ancestor of the other, such as `/notes` and
          #   `/notes/todo.md`. To free the path, rename or delete the memory that
          #   `conflicting_memory_id` references, then retry. To change that memory instead of
          #   creating a new one, update it.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryPathConflictError}
          #   for more details.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryPathConflictError::Type]
          #
          #   @param conflicting_memory_id [String] The ID of the memory that blocked the write (`mem_...`), or an empty string if t
          #
          #   @param conflicting_path [String] The path that blocked the write: the requested path, or the path of a memory tha
          #
          #   @param message [String] A human-readable explanation of the conflict. To handle the error in code, use `

          # @see Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryPathConflictError#type
          module Type
            extend Anthropic::Internal::Type::Enum

            MEMORY_PATH_CONFLICT_ERROR = :memory_path_conflict_error

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
