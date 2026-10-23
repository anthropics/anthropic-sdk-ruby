# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagDefaultSettingSource < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :default]
          required :type, const: :default

          # @!method initialize(type: :default)
          #   No settings level sets a value, and the built-in default applies.
          #
          #   @param type [Symbol, :default]
        end
      end
    end
  end
end
