# typed: strong

module Anthropic
  module Models
    class Base64PDFSource < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::Base64PDFSource, Anthropic::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :data

      sig { returns(Symbol) }
      attr_accessor :media_type

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(data: String, media_type: Symbol, type: Symbol).returns(
          T.attached_class
        )
      end
      def self.new(data:, media_type: :"application/pdf", type: :base64)
      end

      sig do
        override.returns({ data: String, media_type: Symbol, type: Symbol })
      end
      def to_hash
      end
    end
  end
end
