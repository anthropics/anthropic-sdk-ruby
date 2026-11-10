# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagReplyModeAutomatic < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :automatic]
          required :type, const: :automatic

          # @!method initialize(type: :automatic)
          #   Claude reads along and joins in when it can help, and pauses on its own in quiet
          #   or busy channels.
          #
          #   @param type [Symbol, :automatic]
        end
      end
    end
  end
end
