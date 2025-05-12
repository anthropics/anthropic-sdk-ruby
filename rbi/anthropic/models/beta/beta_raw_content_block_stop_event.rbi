# typed: strong

module Anthropic
  module Models
    BetaRawContentBlockStopEvent = Beta::BetaRawContentBlockStopEvent

    module Beta
      class BetaRawContentBlockStopEvent < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaRawContentBlockStopEvent,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Integer) }
        attr_accessor :index

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(index: Integer, type: Symbol).returns(T.attached_class) }
        def self.new(index:, type: :content_block_stop)
        end

        sig { override.returns({ index: Integer, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
