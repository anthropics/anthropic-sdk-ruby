# typed: strong

module Anthropic
  module Models
    BetaCacheMissSystemChanged = Beta::BetaCacheMissSystemChanged

    module Beta
      class BetaCacheMissSystemChanged < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaCacheMissSystemChanged,
              Anthropic::Internal::AnyHash
            )
          end

        # Approximate number of input tokens that would have been read from cache had the
        # prefix matched the previous request.
        sig { returns(Integer) }
        attr_accessor :cache_missed_input_tokens

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(cache_missed_input_tokens: Integer, type: Symbol).returns(
            T.attached_class
          )
        end
        def self.new(
          # Approximate number of input tokens that would have been read from cache had the
          # prefix matched the previous request.
          cache_missed_input_tokens:,
          type: :system_changed
        )
        end

        sig do
          override.returns({ cache_missed_input_tokens: Integer, type: Symbol })
        end
        def to_hash
        end
      end
    end
  end
end
