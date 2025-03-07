# typed: strong

module Anthropic
  module Models
    class ModelRetrieveParams < Anthropic::BaseModel
      extend Anthropic::RequestParameters::Converter
      include Anthropic::RequestParameters

      sig do
        params(request_options: T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything]))
          .returns(T.attached_class)
      end
      def self.new(request_options: {})
      end

      sig { override.returns({request_options: Anthropic::RequestOptions}) }
      def to_hash
      end
    end
  end
end
