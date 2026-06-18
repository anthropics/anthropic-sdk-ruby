# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaRefusalStopDetails < Anthropic::Internal::Type::BaseModel
        # @!attribute category
        #   The policy category that triggered a refusal.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaRefusalStopDetails::Category, nil]
        required :category, enum: -> { Anthropic::Beta::BetaRefusalStopDetails::Category }, nil?: true

        # @!attribute explanation
        #   Human-readable explanation of the refusal.
        #
        #   This text is not guaranteed to be stable. `null` when no explanation is
        #   available for the category.
        #
        #   @return [String, nil]
        required :explanation, String, nil?: true

        # @!attribute fallback_credit_token
        #   Opaque code that refunds the cache-miss cost when retrying this refused request
        #   on the fallback model. Pass it as `fallback_credit_token` on the retry request.
        #   Expires 5 minutes after the refusal.
        #
        #   The retry is sent either with the same request body (`system`, `messages`,
        #   `tools`, and other render-shaping fields), or with the same body plus one
        #   appended `assistant` message whose content is the partial text (with any
        #   trailing whitespace stripped from the final text block) and paired server-tool
        #   blocks from this refusal — which also authorizes that appended turn as an
        #   assistant-prefill continuation on models that otherwise disallow prefill. A
        #   token minted mid-server-tool-loop whose partial content was continuable may only
        #   be redeemed the second way — if a same-body retry is rejected with a 400 saying
        #   the token must be redeemed by continuing the partial response, retry the second
        #   way instead. Either way: same workspace, same platform; a mismatch is a 400.
        #   Resending a token for an already-warm prefix is permitted but yields no
        #   additional credit.
        #
        #   `null` when the refused model isn't eligible for a fallback credit.
        #
        #   @return [String, nil]
        required :fallback_credit_token, String, nil?: true

        # @!attribute fallback_has_prefill_claim
        #   Whether the accompanying `fallback_credit_token` may be redeemed with the
        #   appended-assistant retry form. Only set when `fallback_credit_token` is present.
        #
        #   `true`: retry by resending the same request body plus one appended `assistant`
        #   message whose content is this response's `content` with any trailing whitespace
        #   stripped from the final text block and unpaired `tool_use` blocks omitted (the
        #   same appended-turn shape described on `fallback_credit_token`), with the token
        #   attached. `false`: retry by resending the original request body unchanged, with
        #   the token attached — the appended-assistant form is not available for this
        #   refusal (no continuable partial content, or the request uses `output_format` or
        #   a `tool_choice` that forces tool use). One exception: when the request used
        #   `output_format` or a forced `tool_choice` and the refusal arrived after server
        #   tools (including MCP connector tools) had already executed, the token may not be
        #   redeemable by either retry form; if the exact-body retry is then rejected with a
        #   400 saying the token must be redeemed by continuing the partial response,
        #   discard the token and retry without it.
        #
        #   Advisory: if an appended-assistant retry is rejected with a 400 despite `true`,
        #   fall back to resending the original request body with the token.
        #
        #   @return [Boolean, nil]
        required :fallback_has_prefill_claim, Anthropic::Internal::Type::Boolean, nil?: true

        # @!attribute recommended_model
        #   The server's suggested retry target for this refusal. Populated when a fallback
        #   attempt could not be made (the fallback model's rate limit was exhausted, or it
        #   was overloaded); names the fallback model the caller can retry directly. Null
        #   otherwise.
        #
        #   @return [String, nil]
        required :recommended_model, String, nil?: true

        # @!attribute type
        #
        #   @return [Symbol, :refusal]
        required :type, const: :refusal

        # @!method initialize(category:, explanation:, fallback_credit_token:, fallback_has_prefill_claim:, recommended_model:, type: :refusal)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaRefusalStopDetails} for more details.
        #
        #   Structured information about a refusal.
        #
        #   @param category [Symbol, Anthropic::Models::Beta::BetaRefusalStopDetails::Category, nil] The policy category that triggered a refusal.
        #
        #   @param explanation [String, nil] Human-readable explanation of the refusal.
        #
        #   @param fallback_credit_token [String, nil] Opaque code that refunds the cache-miss cost when retrying this refused
        #
        #   @param fallback_has_prefill_claim [Boolean, nil] Whether the accompanying `fallback_credit_token` may be redeemed with the
        #
        #   @param recommended_model [String, nil] The server's suggested retry target for this refusal. Populated when a fallback
        #
        #   @param type [Symbol, :refusal]

        # The policy category that triggered a refusal.
        #
        # @see Anthropic::Models::Beta::BetaRefusalStopDetails#category
        module Category
          extend Anthropic::Internal::Type::Enum

          CYBER = :cyber
          BIO = :bio
          FRONTIER_LLM = :frontier_llm
          REASONING_EXTRACTION = :reasoning_extraction

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaRefusalStopDetails = Beta::BetaRefusalStopDetails
  end
end
