# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          module ManagedSettings
            class BetaClaudeCodeRBACGroupStatusDeleted < Anthropic::Internal::Type::BaseModel
              # @!attribute type
              #   Always `deleted`.
              #
              #   @return [Symbol, :deleted]
              required :type, const: :deleted

              # @!method initialize(type: :deleted)
              #   @param type [Symbol, :deleted] Always `deleted`.
            end
          end
        end
      end
    end
  end
end
