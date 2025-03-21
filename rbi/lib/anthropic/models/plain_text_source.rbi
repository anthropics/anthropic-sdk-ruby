# typed: strong

module Anthropic
  module Models
    class PlainTextSource < Anthropic::BaseModel
      sig { returns(String) }
      attr_accessor :data

      sig { returns(Symbol) }
      attr_accessor :media_type

      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(data: String, media_type: Symbol, type: Symbol).returns(T.attached_class) }
      def self.new(data:, media_type: :"text/plain", type: :text)
      end

      sig { override.returns({data: String, media_type: Symbol, type: Symbol}) }
      def to_hash
      end
    end
  end
end
