# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaFileScope < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   The ID of the scoping resource (e.g., the session ID).
        #
        #   @return [String]
        required :id, String

        # @!attribute type
        #   The type of scope (e.g., `"session"`).
        #
        #   @return [Symbol, :session]
        required :type, const: :session

        # @!method initialize(id:, type: :session)
        #   @param id [String] The ID of the scoping resource (e.g., the session ID).
        #
        #   @param type [Symbol, :session] The type of scope (e.g., `"session"`).
      end
    end

    BetaFileScope = Beta::BetaFileScope
  end
end
