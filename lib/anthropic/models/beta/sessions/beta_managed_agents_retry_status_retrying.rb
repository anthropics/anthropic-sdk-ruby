# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsRetryStatusRetrying < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :retrying]
          required :type, const: :retrying

          # @!method initialize(type: :retrying)
          #   The server is retrying automatically. Client should wait; the same error type
          #   may fire again as retrying, then once as exhausted when the retry budget runs
          #   out.
          #
          #   @param type [Symbol, :retrying]
        end
      end
    end
  end
end
