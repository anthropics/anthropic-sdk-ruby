# typed: strong

module Anthropic
  module Models
    class RawMessageStreamEvent < Anthropic::Union
      abstract!

      sig do
        override
          .returns(
            [[Symbol, Anthropic::Models::RawMessageStartEvent], [Symbol, Anthropic::Models::RawMessageDeltaEvent], [Symbol, Anthropic::Models::RawMessageStopEvent], [Symbol, Anthropic::Models::RawContentBlockStartEvent], [Symbol, Anthropic::Models::RawContentBlockDeltaEvent], [Symbol, Anthropic::Models::RawContentBlockStopEvent]]
          )
      end
      private_class_method def self.variants
      end
    end
  end
end
