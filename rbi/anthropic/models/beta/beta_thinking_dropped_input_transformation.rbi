# typed: strong

module Anthropic
  module Models
    BetaThinkingDroppedInputTransformation =
      Beta::BetaThinkingDroppedInputTransformation

    module Beta
      class BetaThinkingDroppedInputTransformation < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaThinkingDroppedInputTransformation,
              Anthropic::Internal::AnyHash
            )
          end

        # Where the removed block was in your request, as `messages.{i}.content.{j}`: `i`
        # indexes the `messages` array you sent and `j` that message's `content` array —
        # the same form error messages use.
        sig { returns(String) }
        attr_accessor :path

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
        sig do
          returns(
            Anthropic::Beta::BetaThinkingDroppedInputTransformation::Reason::TaggedSymbol
          )
        end
        attr_accessor :reason

        # Always `thinking_dropped` for this entry type.
        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            path: String,
            reason:
              Anthropic::Beta::BetaThinkingDroppedInputTransformation::Reason::OrSymbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
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
          reason:,
          # Always `thinking_dropped` for this entry type.
          type: :thinking_dropped
        )
        end

        sig do
          override.returns(
            {
              path: String,
              reason:
                Anthropic::Beta::BetaThinkingDroppedInputTransformation::Reason::TaggedSymbol,
              type: Symbol
            }
          )
        end
        def to_hash
        end

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
        module Reason
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaThinkingDroppedInputTransformation::Reason
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MODEL_BINDING_MISMATCH =
            T.let(
              :model_binding_mismatch,
              Anthropic::Beta::BetaThinkingDroppedInputTransformation::Reason::TaggedSymbol
            )
          PREFIX_BINDING_MISMATCH =
            T.let(
              :prefix_binding_mismatch,
              Anthropic::Beta::BetaThinkingDroppedInputTransformation::Reason::TaggedSymbol
            )
          ORGANIZATION_BINDING_MISMATCH =
            T.let(
              :organization_binding_mismatch,
              Anthropic::Beta::BetaThinkingDroppedInputTransformation::Reason::TaggedSymbol
            )
          END_USER_BINDING_MISMATCH =
            T.let(
              :end_user_binding_mismatch,
              Anthropic::Beta::BetaThinkingDroppedInputTransformation::Reason::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaThinkingDroppedInputTransformation::Reason::TaggedSymbol
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
