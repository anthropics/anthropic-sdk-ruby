# typed: strong

module Anthropic
  module Models
    module Beta
      class BetaRawMessageStopEvent < Anthropic::BaseModel
        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :message_stop)
        end

        sig { override.returns({type: Symbol}) }
        def to_hash
        end
      end
    end

    BetaRawMessageStopEvent = Beta::BetaRawMessageStopEvent
  end
end
