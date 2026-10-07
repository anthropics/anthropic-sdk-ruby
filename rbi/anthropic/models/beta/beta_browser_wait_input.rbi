# typed: strong

module Anthropic
  module Models
    BetaBrowserWaitInput = Beta::BetaBrowserWaitInput

    module Beta
      class BetaBrowserWaitInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBrowserWaitInput,
              Anthropic::Internal::AnyHash
            )
          end

        # Seconds to wait (maximum 30).
        sig { returns(Float) }
        attr_accessor :duration

        # Tab to act on. Defaults to the active tab when omitted.
        sig { returns(T.nilable(String)) }
        attr_accessor :tab_id

        # Pause for the given duration.
        sig do
          params(duration: Float, tab_id: T.nilable(String)).returns(
            T.attached_class
          )
        end
        def self.new(
          # Seconds to wait (maximum 30).
          duration:,
          # Tab to act on. Defaults to the active tab when omitted.
          tab_id: nil
        )
        end

        sig { override.returns({ duration: Float, tab_id: T.nilable(String) }) }
        def to_hash
        end
      end
    end
  end
end
