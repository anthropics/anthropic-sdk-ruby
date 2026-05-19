# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Environments
        class BetaSessionWorkData < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Session identifier (e.g., 'session\_...')
          #
          #   @return [String]
          required :id, String

          # @!attribute type
          #   Type of work data
          #
          #   @return [Symbol, :session]
          required :type, const: :session

          # @!method initialize(id:, type: :session)
          #   Work data for session work items.
          #
          #   This resource type is used when work represents a session that needs to be
          #   executed in a self-hosted environment.
          #
          #   @param id [String] Session identifier (e.g., 'session\_...')
          #
          #   @param type [Symbol, :session] Type of work data
        end
      end
    end
  end
end
