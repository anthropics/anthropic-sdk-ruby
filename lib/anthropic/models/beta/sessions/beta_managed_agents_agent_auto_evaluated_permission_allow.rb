# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsAgentAutoEvaluatedPermissionAllow < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :allow]
          required :type, const: :allow

          # @!method initialize(type: :allow)
          #   The server judged the invocation safe to execute without client approval.
          #
          #   @param type [Symbol, :allow]
        end
      end
    end
  end
end
