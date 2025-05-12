# typed: strong

module Anthropic
  module Models
    module Messages
      class BatchRetrieveParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Messages::BatchRetrieveParams,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          params(request_options: Anthropic::RequestOptions::OrHash).returns(
            T.attached_class
          )
        end
        def self.new(request_options: {})
        end

        sig { override.returns({ request_options: Anthropic::RequestOptions }) }
        def to_hash
        end
      end
    end
  end
end
