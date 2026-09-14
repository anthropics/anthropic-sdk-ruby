# typed: strong

module Anthropic
  module Models
    BetaThinkingMismatchAllowedInputTransformation =
      Beta::BetaThinkingMismatchAllowedInputTransformation

    module Beta
      class BetaThinkingMismatchAllowedInputTransformation < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaThinkingMismatchAllowedInputTransformation,
              Anthropic::Internal::AnyHash
            )
          end

        # Where the block is in your request, as `messages.{i}.content.{j}`: `i` indexes
        # the `messages` array you sent and `j` that message's `content` array — the same
        # form error messages use.
        sig { returns(String) }
        attr_accessor :path

        # Which binding check the block failed; the block was shown to the model all the
        # same. Always `prefix_binding_mismatch` today — the conversation before the block
        # differs from the conversation it was created in, or the block carries no record
        # of one on a model that requires it. Were the check enforced for this request,
        # the block would have been removed or the request rejected
        # (`thinking.block_binding.prefix_mismatch_behavior`). A removal also takes the
        # rest of that turn's consecutive thinking blocks, whereas here each block is
        # checked on its own, so `thinking_mismatch_allowed` entries are a lower bound on
        # what enforcement would remove.
        sig do
          returns(
            Anthropic::Beta::BetaThinkingMismatchAllowedInputTransformation::Reason::TaggedSymbol
          )
        end
        attr_accessor :reason

        # Always `thinking_mismatch_allowed` for this entry type.
        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            path: String,
            reason:
              Anthropic::Beta::BetaThinkingMismatchAllowedInputTransformation::Reason::OrSymbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Where the block is in your request, as `messages.{i}.content.{j}`: `i` indexes
          # the `messages` array you sent and `j` that message's `content` array — the same
          # form error messages use.
          path:,
          # Which binding check the block failed; the block was shown to the model all the
          # same. Always `prefix_binding_mismatch` today — the conversation before the block
          # differs from the conversation it was created in, or the block carries no record
          # of one on a model that requires it. Were the check enforced for this request,
          # the block would have been removed or the request rejected
          # (`thinking.block_binding.prefix_mismatch_behavior`). A removal also takes the
          # rest of that turn's consecutive thinking blocks, whereas here each block is
          # checked on its own, so `thinking_mismatch_allowed` entries are a lower bound on
          # what enforcement would remove.
          reason:,
          # Always `thinking_mismatch_allowed` for this entry type.
          type: :thinking_mismatch_allowed
        )
        end

        sig do
          override.returns(
            {
              path: String,
              reason:
                Anthropic::Beta::BetaThinkingMismatchAllowedInputTransformation::Reason::TaggedSymbol,
              type: Symbol
            }
          )
        end
        def to_hash
        end

        # Which binding check the block failed; the block was shown to the model all the
        # same. Always `prefix_binding_mismatch` today — the conversation before the block
        # differs from the conversation it was created in, or the block carries no record
        # of one on a model that requires it. Were the check enforced for this request,
        # the block would have been removed or the request rejected
        # (`thinking.block_binding.prefix_mismatch_behavior`). A removal also takes the
        # rest of that turn's consecutive thinking blocks, whereas here each block is
        # checked on its own, so `thinking_mismatch_allowed` entries are a lower bound on
        # what enforcement would remove.
        module Reason
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaThinkingMismatchAllowedInputTransformation::Reason
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MODEL_BINDING_MISMATCH =
            T.let(
              :model_binding_mismatch,
              Anthropic::Beta::BetaThinkingMismatchAllowedInputTransformation::Reason::TaggedSymbol
            )
          PREFIX_BINDING_MISMATCH =
            T.let(
              :prefix_binding_mismatch,
              Anthropic::Beta::BetaThinkingMismatchAllowedInputTransformation::Reason::TaggedSymbol
            )
          ORGANIZATION_BINDING_MISMATCH =
            T.let(
              :organization_binding_mismatch,
              Anthropic::Beta::BetaThinkingMismatchAllowedInputTransformation::Reason::TaggedSymbol
            )
          END_USER_BINDING_MISMATCH =
            T.let(
              :end_user_binding_mismatch,
              Anthropic::Beta::BetaThinkingMismatchAllowedInputTransformation::Reason::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaThinkingMismatchAllowedInputTransformation::Reason::TaggedSymbol
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
