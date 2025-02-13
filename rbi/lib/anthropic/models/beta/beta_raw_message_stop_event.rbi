# typed: strong

module Anthropic
  module Models
    BetaRawMessageStopEvent = T.type_alias { Beta::BetaRawMessageStopEvent }

    module Beta
      class BetaRawMessageStopEvent < Anthropic::BaseModel
        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        sig { params(type: Symbol).void }
        def initialize(type: :message_stop)
        end

        sig { override.returns({type: Symbol}) }
        def to_hash
        end
      end
    end
  end
end
