# typed: strong

module Anthropic
  module Models
    class TextDelta < Anthropic::BaseModel
      Shape = T.type_alias { {text: String, type: Symbol} }

      sig { returns(String) }
      attr_accessor :text

      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(text: String, type: Symbol).void }
      def initialize(text:, type: :text_delta); end

      sig { returns(Anthropic::Models::TextDelta::Shape) }
      def to_h; end
    end
  end
end
