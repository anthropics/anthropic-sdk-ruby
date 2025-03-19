# typed: strong

module Anthropic
  module Models
    module Beta
      class BetaRawContentBlockStopEvent < Anthropic::BaseModel
        sig { returns(Integer) }
        def index
        end

        sig { params(_: Integer).returns(Integer) }
        def index=(_)
        end

        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        sig { params(index: Integer, type: Symbol).returns(T.attached_class) }
        def self.new(index:, type: :content_block_stop)
        end

        sig { override.returns({index: Integer, type: Symbol}) }
        def to_hash
        end
      end
    end

    BetaRawContentBlockStopEvent = Beta::BetaRawContentBlockStopEvent
  end
end
