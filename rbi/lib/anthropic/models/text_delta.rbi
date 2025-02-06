# typed: strong

module Anthropic
  module Models
    class TextDelta < Anthropic::BaseModel
      sig { returns(String) }
      attr_accessor :text

      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(text: String, type: Symbol).void }
      def initialize(text:, type: :text_delta); end

      sig { override.returns({text: String, type: Symbol}) }
      def to_hash; end
    end
  end
end
