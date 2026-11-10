# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagReplyModeAlwaysAwake < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :always_awake]
          required :type, const: :always_awake

          # @!method initialize(type: :always_awake)
          #   Like `automatic`, but Claude never pauses on its own. Available where it is
          #   enabled for the channel.
          #
          #   @param type [Symbol, :always_awake]
        end
      end
    end
  end
end
