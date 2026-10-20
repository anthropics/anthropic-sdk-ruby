# typed: strong

module Anthropic
  module Models
    BetaCacheMissUnavailable = Beta::BetaCacheMissUnavailable

    module Beta
      class BetaCacheMissUnavailable < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaCacheMissUnavailable,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # A `cache_miss_reason` for when the API can't give a diagnosis. The request
        # itself was processed normally.
        #
        # This includes a request whose `model`, `system`, and `tools` match the previous
        # request's but whose other prompt-affecting parameters, such as `thinking` or
        # `tool_choice`, differ.
        #
        # See the
        # [cache diagnostics guide](https://platform.claude.com/docs/en/build-with-claude/cache-diagnostics#cache-miss-reason-types)
        # to learn what to change for each reason.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :unavailable)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
