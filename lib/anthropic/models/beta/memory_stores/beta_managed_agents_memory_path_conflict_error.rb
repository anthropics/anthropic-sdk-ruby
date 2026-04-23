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
          #
          #   @return [String, nil]
          optional :conflicting_memory_id, String

          # @!attribute conflicting_path
          #
          #   @return [String, nil]
          optional :conflicting_path, String

          # @!attribute message
          #
          #   @return [String, nil]
          optional :message, String

          # @!method initialize(type:, conflicting_memory_id: nil, conflicting_path: nil, message: nil)
          #   @param type [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryPathConflictError::Type]
          #   @param conflicting_memory_id [String]
          #   @param conflicting_path [String]
          #   @param message [String]

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
