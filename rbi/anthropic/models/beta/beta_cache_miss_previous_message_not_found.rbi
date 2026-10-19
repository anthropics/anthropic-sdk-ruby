# typed: strong

module Anthropic
  module Models
    BetaCacheMissPreviousMessageNotFound =
      Beta::BetaCacheMissPreviousMessageNotFound

    module Beta
      class BetaCacheMissPreviousMessageNotFound < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaCacheMissPreviousMessageNotFound,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # A `cache_miss_reason` for when the API doesn't have a stored record of the
        # request that `diagnostics.previous_message_id` references.
        #
        # This doesn't mean that this request changed.
        #
        # See the
        # [cache diagnostics guide](https://platform.claude.com/docs/en/build-with-claude/cache-diagnostics#cache-miss-reason-types)
        # to learn what to change for each reason.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :previous_message_not_found)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
