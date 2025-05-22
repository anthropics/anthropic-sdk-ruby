# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaContainer < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   Identifier for the container used in this request
        #
        #   @return [String]
        required :id, String

        # @!attribute expires_at
        #   The time at which the container will expire.
        #
        #   @return [Time]
        required :expires_at, Time

        # @!method initialize(id:, expires_at:)
        #   Information about the container used in the request (for the code execution
        #   tool)
        #
        #   @param id [String] Identifier for the container used in this request
        #
        #   @param expires_at [Time] The time at which the container will expire.
      end
    end

    BetaContainer = Beta::BetaContainer
  end
end
