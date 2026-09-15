# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaThinkingMismatchAllowedInputTransformation < Anthropic::Internal::Type::BaseModel
        # @!attribute path
        #   Where the block is in your request, as `messages.{i}.content.{j}`: `i` indexes
        #   the `messages` array you sent and `j` that message's `content` array — the same
        #   form error messages use.
        #
        #   @return [String]
        required :path, String

        # @!attribute reason
        #   Which binding check the block failed; the block was shown to the model all the
        #   same. Always `prefix_binding_mismatch` today — the conversation before the block
        #   differs from the conversation it was created in, or the block carries no record
        #   of one on a model that requires it. Were the check enforced for this request,
        #   the block would have been removed or the request rejected
        #   (`thinking.block_binding.prefix_mismatch_behavior`). A removal also takes the
        #   rest of that turn's consecutive thinking blocks, whereas here each block is
        #   checked on its own, so `thinking_mismatch_allowed` entries are a lower bound on
        #   what enforcement would remove.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaThinkingMismatchAllowedInputTransformation::Reason]
        required :reason, enum: -> { Anthropic::Beta::BetaThinkingMismatchAllowedInputTransformation::Reason }

        # @!attribute type
        #   Always `thinking_mismatch_allowed` for this entry type.
        #
        #   @return [Symbol, :thinking_mismatch_allowed]
        required :type, const: :thinking_mismatch_allowed

        # @!method initialize(path:, reason:, type: :thinking_mismatch_allowed)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaThinkingMismatchAllowedInputTransformation} for
        #   more details.
        #
        #   @param path [String] Where the block is in your request, as `messages.{i}.content.{j}`:
        #
        #   @param reason [Symbol, Anthropic::Models::Beta::BetaThinkingMismatchAllowedInputTransformation::Reason] Which binding check the block failed; the block was shown to the model all
        #
        #   @param type [Symbol, :thinking_mismatch_allowed] Always `thinking_mismatch_allowed` for this entry type.

        # Which binding check the block failed; the block was shown to the model all the
        # same. Always `prefix_binding_mismatch` today — the conversation before the block
        # differs from the conversation it was created in, or the block carries no record
        # of one on a model that requires it. Were the check enforced for this request,
        # the block would have been removed or the request rejected
        # (`thinking.block_binding.prefix_mismatch_behavior`). A removal also takes the
        # rest of that turn's consecutive thinking blocks, whereas here each block is
        # checked on its own, so `thinking_mismatch_allowed` entries are a lower bound on
        # what enforcement would remove.
        #
        # @see Anthropic::Models::Beta::BetaThinkingMismatchAllowedInputTransformation#reason
        module Reason
          extend Anthropic::Internal::Type::Enum

          MODEL_BINDING_MISMATCH = :model_binding_mismatch
          PREFIX_BINDING_MISMATCH = :prefix_binding_mismatch
          ORGANIZATION_BINDING_MISMATCH = :organization_binding_mismatch
          END_USER_BINDING_MISMATCH = :end_user_binding_mismatch

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaThinkingMismatchAllowedInputTransformation = Beta::BetaThinkingMismatchAllowedInputTransformation
  end
end
