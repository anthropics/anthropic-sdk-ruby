# typed: strong

module Anthropic
  module Models
    module Beta
      class ModelRetrieveParams < Anthropic::BaseModel
        extend Anthropic::Type::RequestParameters::Converter
        include Anthropic::RequestParameters

        sig do
          params(request_options: T.any(Anthropic::RequestOptions, Anthropic::Util::AnyHash))
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
end
