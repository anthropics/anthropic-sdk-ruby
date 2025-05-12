# typed: strong

module Anthropic
  module Models
    class URLPDFSource < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::URLPDFSource, Anthropic::Internal::AnyHash)
        end

      sig { returns(Symbol) }
      attr_accessor :type

      sig { returns(String) }
      attr_accessor :url

      sig { params(url: String, type: Symbol).returns(T.attached_class) }
      def self.new(url:, type: :url)
      end

      sig { override.returns({ type: Symbol, url: String }) }
      def to_hash
      end
    end
  end
end
