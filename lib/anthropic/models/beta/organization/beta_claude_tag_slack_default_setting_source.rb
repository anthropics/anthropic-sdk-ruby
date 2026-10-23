# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagSlackDefaultSettingSource < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :slack_default]
          required :type, const: :slack_default

          # @!method initialize(type: :slack_default)
          #   The value comes from the organization's Slack defaults, which have no
          #   identifier.
          #
          #   @param type [Symbol, :slack_default]
        end
      end
    end
  end
end
