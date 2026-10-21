# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsConflictError < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :conflict_error]
          required :type, const: :conflict_error

          # @!attribute message
          #
          #   @return [String, nil]
          optional :message, String

          # @!method initialize(message: nil, type: :conflict_error)
          #   @param message [String]
          #   @param type [Symbol, :conflict_error]
        end
      end
    end
  end
end
