# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagReplyModeMentionOnly < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :mention_only]
          required :type, const: :mention_only

          # @!method initialize(type: :mention_only)
          #   Claude replies only when it is @-mentioned.
          #
          #   @param type [Symbol, :mention_only]
        end
      end
    end
  end
end
