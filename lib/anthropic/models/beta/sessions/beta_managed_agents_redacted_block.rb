# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsRedactedBlock < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :redacted]
          required :type, const: :redacted

          # @!method initialize(type: :redacted)
          #   Placeholder for content withheld by Anthropic model policy.
          #
          #   @param type [Symbol, :redacted]
        end
      end
    end
  end
end
