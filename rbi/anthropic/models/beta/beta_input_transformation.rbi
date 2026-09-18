# typed: strong

module Anthropic
  module Models
    BetaInputTransformation = Beta::BetaInputTransformation

    module Beta
      # One entry of `input_transformations`: either a change the API made to the
      # request's input before showing it to the model, or a block that failed a binding
      # check and was still shown to the model unchanged. The `type` field says which.
      module BetaInputTransformation
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaThinkingDroppedInputTransformation,
              Anthropic::Beta::BetaThinkingMismatchAllowedInputTransformation
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaInputTransformation::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          THINKING_DROPPED =
            T.let(
              :thinking_dropped,
              Anthropic::Beta::BetaInputTransformation::Type::TaggedSymbol
            )
          THINKING_MISMATCH_ALLOWED =
            T.let(
              :thinking_mismatch_allowed,
              Anthropic::Beta::BetaInputTransformation::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaInputTransformation::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaInputTransformation::Variants]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type: Anthropic::Beta::BetaInputTransformation::Type::OrSymbol,
            path: String,
            reason:
              T.any(
                Anthropic::Beta::BetaThinkingDroppedInputTransformation::Reason::OrSymbol,
                Anthropic::Beta::BetaThinkingMismatchAllowedInputTransformation::Reason::OrSymbol
              )
          ).returns(Anthropic::Beta::BetaInputTransformation::Variants)
        end
        def self.new(
          type:,
          # Where the removed block was in your request, as `messages.{i}.content.{j}`: `i`
          # indexes the `messages` array you sent and `j` that message's `content` array —
          # the same form error messages use.
          path:,
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
          reason:
        )
        end
      end
    end
  end
end
