# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          module ManagedSettings
            class BetaClaudeCodeManagedSettingsOrganizationMode < Anthropic::Internal::Type::BaseModel
              # @!attribute type
              #   Always `organization`.
              #
              #   @return [Symbol, :organization]
              required :type, const: :organization

              # @!method initialize(type: :organization)
              #   @param type [Symbol, :organization] Always `organization`.
            end
          end
        end
      end
    end
  end
end
