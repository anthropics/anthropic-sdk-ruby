# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsRetryStatusExhausted < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :exhausted]
          required :type, const: :exhausted

          # @!method initialize(type: :exhausted)
          #   This turn is dead; queued inputs are flushed and the session returns to idle.
          #   Client may send a new prompt.
          #
          #   @param type [Symbol, :exhausted]
        end
      end
    end
  end
end
