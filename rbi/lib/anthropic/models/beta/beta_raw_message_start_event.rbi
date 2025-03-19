# typed: strong

module Anthropic
  module Models
    module Beta
      class BetaRawMessageStartEvent < Anthropic::BaseModel
        sig { returns(Anthropic::Models::Beta::BetaMessage) }
        def message
        end

        sig { params(_: Anthropic::Models::Beta::BetaMessage).returns(Anthropic::Models::Beta::BetaMessage) }
        def message=(_)
        end

        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        sig { params(message: Anthropic::Models::Beta::BetaMessage, type: Symbol).returns(T.attached_class) }
        def self.new(message:, type: :message_start)
        end

        sig { override.returns({message: Anthropic::Models::Beta::BetaMessage, type: Symbol}) }
        def to_hash
        end
      end
    end

    BetaRawMessageStartEvent = Beta::BetaRawMessageStartEvent
  end
end
