# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          module ManagedSettings
            class BetaClaudeCodeRBACGroupStatusActive < Anthropic::Internal::Type::BaseModel
              # @!attribute type
              #   Always `active`.
              #
              #   @return [Symbol, :active]
              required :type, const: :active

              # @!method initialize(type: :active)
              #   @param type [Symbol, :active] Always `active`.
            end
          end
        end
      end
    end
  end
end
