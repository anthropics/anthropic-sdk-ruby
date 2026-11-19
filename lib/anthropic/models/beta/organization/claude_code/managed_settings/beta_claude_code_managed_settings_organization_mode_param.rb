# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          module ManagedSettings
            class BetaClaudeCodeManagedSettingsOrganizationModeParam < Anthropic::Internal::Type::BaseModel
              # @!attribute type
              #
              #   @return [Symbol, :organization]
              required :type, const: :organization

              # @!method initialize(type: :organization)
              #   @param type [Symbol, :organization]
            end
          end
        end
      end
    end
  end
end
