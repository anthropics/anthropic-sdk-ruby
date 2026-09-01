# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaThinkingDroppedInputTransformation < Anthropic::Internal::Type::BaseModel
        # @!attribute path
        #   Where the removed block was in your request, as `messages.{i}.content.{j}`: `i`
        #   indexes the `messages` array you sent and `j` that message's `content` array —
        #   the same form error messages use.
        #
        #   @return [String]
        required :path, String

        # @!attribute reason
        #   Which binding check removed the block: `model_binding_mismatch` — it was created
        #   by a model whose reasoning the requested model may not read;
        #   `prefix_binding_mismatch` — the conversation before it differs from the
        #   conversation it was created in (the rest of that turn's consecutive thinking
        #   blocks are removed with it, each with this reason);
        #   `organization_binding_mismatch` — it was created under a different organization
        #   (an Anthropic organization, AWS account or Google Cloud project) and this
        #   organization is not one of its additional organizations;
        #   `end_user_binding_mismatch` — it was created for a different end user, or was
        #   removed by the consumer-organization binding. A block that would fail several
        #   checks reports one reason, in this order of precedence:
        #   `organization_binding_mismatch`, `end_user_binding_mismatch`,
        #   `model_binding_mismatch`, `prefix_binding_mismatch`.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaThinkingDroppedInputTransformation::Reason]
        required :reason, enum: -> { Anthropic::Beta::BetaThinkingDroppedInputTransformation::Reason }

        # @!attribute type
        #   Always `thinking_dropped` for this entry type.
        #
        #   @return [Symbol, :thinking_dropped]
        required :type, const: :thinking_dropped

        # @!method initialize(path:, reason:, type: :thinking_dropped)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaThinkingDroppedInputTransformation} for more
        #   details.
        #
        #   @param path [String] Where the removed block was in your request, as `messages.{i}.content.{j}`:
        #
        #   @param reason [Symbol, Anthropic::Models::Beta::BetaThinkingDroppedInputTransformation::Reason] Which binding check removed the block: `model_binding_mismatch` — it was
        #
        #   @param type [Symbol, :thinking_dropped] Always `thinking_dropped` for this entry type.

        # Which binding check removed the block: `model_binding_mismatch` — it was created
        # by a model whose reasoning the requested model may not read;
        # `prefix_binding_mismatch` — the conversation before it differs from the
        # conversation it was created in (the rest of that turn's consecutive thinking
        # blocks are removed with it, each with this reason);
        # `organization_binding_mismatch` — it was created under a different organization
        # (an Anthropic organization, AWS account or Google Cloud project) and this
        # organization is not one of its additional organizations;
        # `end_user_binding_mismatch` — it was created for a different end user, or was
        # removed by the consumer-organization binding. A block that would fail several
        # checks reports one reason, in this order of precedence:
        # `organization_binding_mismatch`, `end_user_binding_mismatch`,
        # `model_binding_mismatch`, `prefix_binding_mismatch`.
        #
        # @see Anthropic::Models::Beta::BetaThinkingDroppedInputTransformation#reason
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

    BetaThinkingDroppedInputTransformation = Beta::BetaThinkingDroppedInputTransformation
  end
end
