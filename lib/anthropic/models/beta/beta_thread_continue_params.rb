# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaThreadContinueParams < Anthropic::Internal::Type::BaseModel
        # @!attribute previous_message_id
        #   The `id` of the previous response in this Thread.
        #
        #   @return [String]
        required :previous_message_id, String

        # @!attribute type
        #
        #   @return [Symbol, :continue]
        required :type, const: :continue

        # @!method initialize(previous_message_id:, type: :continue)
        #   Resume from the response named by `previous_message_id`.
        #
        #   @param previous_message_id [String] The `id` of the previous response in this Thread.
        #
        #   @param type [Symbol, :continue]
      end
    end

    BetaThreadContinueParams = Beta::BetaThreadContinueParams
  end
end
