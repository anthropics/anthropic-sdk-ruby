# typed: strong

module Anthropic
  module Models
    BetaRefusalStopDetails = Beta::BetaRefusalStopDetails

    module Beta
      class BetaRefusalStopDetails < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaRefusalStopDetails,
              Anthropic::Internal::AnyHash
            )
          end

        # The policy category that triggered a refusal.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaRefusalStopDetails::Category::TaggedSymbol
            )
          )
        end
        attr_accessor :category

        # Human-readable explanation of the refusal.
        #
        # This text is not guaranteed to be stable. `null` when no explanation is
        # available for the category.
        sig { returns(T.nilable(String)) }
        attr_accessor :explanation

        # Opaque code that refunds the cache-miss cost when retrying this refused request
        # on the fallback model. Pass it as `fallback_credit_token` on the retry request.
        # Expires 5 minutes after the refusal.
        #
        # The retry is sent either with the same request body (`system`, `messages`,
        # `tools`, and other render-shaping fields), or with the same body plus one
        # appended `assistant` message whose content is the partial text (with any
        # trailing whitespace stripped from the final text block) and paired server-tool
        # blocks from this refusal — which also authorizes that appended turn as an
        # assistant-prefill continuation on models that otherwise disallow prefill. A
        # token minted mid-server-tool-loop whose partial content was continuable may only
        # be redeemed the second way — if a same-body retry is rejected with a 400 saying
        # the token must be redeemed by continuing the partial response, retry the second
        # way instead. Either way: same workspace, same platform; a mismatch is a 400.
        # Resending a token for an already-warm prefix is permitted but yields no
        # additional credit.
        #
        # `null` when the refused model isn't eligible for a fallback credit.
        sig { returns(T.nilable(String)) }
        attr_accessor :fallback_credit_token

        # Whether the accompanying `fallback_credit_token` may be redeemed with the
        # appended-assistant retry form. Only set when `fallback_credit_token` is present.
        #
        # `true`: retry by resending the same request body plus one appended `assistant`
        # message whose content is this response's `content` with any trailing whitespace
        # stripped from the final text block and unpaired `tool_use` blocks omitted (the
        # same appended-turn shape described on `fallback_credit_token`), with the token
        # attached. `false`: retry by resending the original request body unchanged, with
        # the token attached — the appended-assistant form is not available for this
        # refusal (no continuable partial content, or the request uses `output_format` or
        # a `tool_choice` that forces tool use). One exception: when the request used
        # `output_format` or a forced `tool_choice` and the refusal arrived after server
        # tools (including MCP connector tools) had already executed, the token may not be
        # redeemable by either retry form; if the exact-body retry is then rejected with a
        # 400 saying the token must be redeemed by continuing the partial response,
        # discard the token and retry without it.
        #
        # Advisory: if an appended-assistant retry is rejected with a 400 despite `true`,
        # fall back to resending the original request body with the token.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :fallback_has_prefill_claim

        # The server's suggested retry target for this refusal. Populated when a fallback
        # attempt could not be made (the fallback model's rate limit was exhausted, or it
        # was overloaded); names the fallback model the caller can retry directly. Null
        # otherwise.
        sig { returns(T.nilable(String)) }
        attr_accessor :recommended_model

        sig { returns(Symbol) }
        attr_accessor :type

        # Structured information about a refusal.
        sig do
          params(
            category:
              T.nilable(
                Anthropic::Beta::BetaRefusalStopDetails::Category::OrSymbol
              ),
            explanation: T.nilable(String),
            fallback_credit_token: T.nilable(String),
            fallback_has_prefill_claim: T.nilable(T::Boolean),
            recommended_model: T.nilable(String),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The policy category that triggered a refusal.
          category:,
          # Human-readable explanation of the refusal.
          #
          # This text is not guaranteed to be stable. `null` when no explanation is
          # available for the category.
          explanation:,
          # Opaque code that refunds the cache-miss cost when retrying this refused request
          # on the fallback model. Pass it as `fallback_credit_token` on the retry request.
          # Expires 5 minutes after the refusal.
          #
          # The retry is sent either with the same request body (`system`, `messages`,
          # `tools`, and other render-shaping fields), or with the same body plus one
          # appended `assistant` message whose content is the partial text (with any
          # trailing whitespace stripped from the final text block) and paired server-tool
          # blocks from this refusal — which also authorizes that appended turn as an
          # assistant-prefill continuation on models that otherwise disallow prefill. A
          # token minted mid-server-tool-loop whose partial content was continuable may only
          # be redeemed the second way — if a same-body retry is rejected with a 400 saying
          # the token must be redeemed by continuing the partial response, retry the second
          # way instead. Either way: same workspace, same platform; a mismatch is a 400.
          # Resending a token for an already-warm prefix is permitted but yields no
          # additional credit.
          #
          # `null` when the refused model isn't eligible for a fallback credit.
          fallback_credit_token:,
          # Whether the accompanying `fallback_credit_token` may be redeemed with the
          # appended-assistant retry form. Only set when `fallback_credit_token` is present.
          #
          # `true`: retry by resending the same request body plus one appended `assistant`
          # message whose content is this response's `content` with any trailing whitespace
          # stripped from the final text block and unpaired `tool_use` blocks omitted (the
          # same appended-turn shape described on `fallback_credit_token`), with the token
          # attached. `false`: retry by resending the original request body unchanged, with
          # the token attached — the appended-assistant form is not available for this
          # refusal (no continuable partial content, or the request uses `output_format` or
          # a `tool_choice` that forces tool use). One exception: when the request used
          # `output_format` or a forced `tool_choice` and the refusal arrived after server
          # tools (including MCP connector tools) had already executed, the token may not be
          # redeemable by either retry form; if the exact-body retry is then rejected with a
          # 400 saying the token must be redeemed by continuing the partial response,
          # discard the token and retry without it.
          #
          # Advisory: if an appended-assistant retry is rejected with a 400 despite `true`,
          # fall back to resending the original request body with the token.
          fallback_has_prefill_claim:,
          # The server's suggested retry target for this refusal. Populated when a fallback
          # attempt could not be made (the fallback model's rate limit was exhausted, or it
          # was overloaded); names the fallback model the caller can retry directly. Null
          # otherwise.
          recommended_model:,
          type: :refusal
        )
        end

        sig do
          override.returns(
            {
              category:
                T.nilable(
                  Anthropic::Beta::BetaRefusalStopDetails::Category::TaggedSymbol
                ),
              explanation: T.nilable(String),
              fallback_credit_token: T.nilable(String),
              fallback_has_prefill_claim: T.nilable(T::Boolean),
              recommended_model: T.nilable(String),
              type: Symbol
            }
          )
        end
        def to_hash
        end

        # The policy category that triggered a refusal.
        module Category
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaRefusalStopDetails::Category)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CYBER =
            T.let(
              :cyber,
              Anthropic::Beta::BetaRefusalStopDetails::Category::TaggedSymbol
            )
          BIO =
            T.let(
              :bio,
              Anthropic::Beta::BetaRefusalStopDetails::Category::TaggedSymbol
            )
          FRONTIER_LLM =
            T.let(
              :frontier_llm,
              Anthropic::Beta::BetaRefusalStopDetails::Category::TaggedSymbol
            )
          REASONING_EXTRACTION =
            T.let(
              :reasoning_extraction,
              Anthropic::Beta::BetaRefusalStopDetails::Category::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaRefusalStopDetails::Category::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
