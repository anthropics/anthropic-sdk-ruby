# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagReplyModeThread < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :thread]
          required :type, const: :thread

          # @!method initialize(type: :thread)
          #   Every new top-level message in the channel gets its own reply from Claude, in a
          #   thread under it. Available where it is enabled for the channel, and only once
          #   Claude has been used in the channel.
          #
          #   @param type [Symbol, :thread]
        end
      end
    end
  end
end
