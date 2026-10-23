# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagGuestPolicyChannelOnly < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :channel_only]
          required :type, const: :channel_only

          # @!method initialize(type: :channel_only)
          #   Claude answers with only the Bundles attached to the channel itself.
          #
          #   @param type [Symbol, :channel_only]
        end
      end
    end
  end
end
