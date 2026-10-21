# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionRetriesExhausted < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :retries_exhausted]
          required :type, const: :retries_exhausted

          # @!method initialize(type: :retries_exhausted)
          #   The turn ended because repeated errors exhausted the retry budget or an error
          #   escalated to `retry_status: 'exhausted'`.
          #
          #   @param type [Symbol, :retries_exhausted]
        end
      end
    end
  end
end
