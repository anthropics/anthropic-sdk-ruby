# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          module ManagedSettings
            class BetaClaudeCodeRBACGroupStatusUnknown < Anthropic::Internal::Type::BaseModel
              # @!attribute type
              #   Always `unknown`.
              #
              #   @return [Symbol, :unknown]
              required :type, const: :unknown

              # @!method initialize(type: :unknown)
              #   @param type [Symbol, :unknown] Always `unknown`.
            end
          end
        end
      end
    end
  end
end
