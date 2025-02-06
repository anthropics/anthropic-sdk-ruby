# typed: strong

module Anthropic
  module Models
    BetaRawMessageStartEvent = T.type_alias { Beta::BetaRawMessageStartEvent }

    module Beta
      class BetaRawMessageStartEvent < Anthropic::BaseModel
        sig { returns(Anthropic::Models::Beta::BetaMessage) }
        attr_accessor :message

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(message: Anthropic::Models::Beta::BetaMessage, type: Symbol).void }
        def initialize(message:, type: :message_start); end

        sig { override.returns({message: Anthropic::Models::Beta::BetaMessage, type: Symbol}) }
        def to_hash; end
      end
    end
  end
end
