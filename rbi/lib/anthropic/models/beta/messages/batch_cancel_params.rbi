# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BatchCancelParams < Anthropic::BaseModel
          extend Anthropic::RequestParameters::Converter
          include Anthropic::RequestParameters

          Shape = T.type_alias do
            T.all(
              {betas: T::Array[Anthropic::Models::AnthropicBeta::Variants]},
              Anthropic::RequestParameters::Shape
            )
          end

          sig { returns(T::Array[Anthropic::Models::AnthropicBeta::Variants]) }
          attr_reader :betas

          sig { params(betas: T::Array[Anthropic::Models::AnthropicBeta::Variants]).void }
          attr_writer :betas

          sig do
            params(
              betas: T::Array[Anthropic::Models::AnthropicBeta::Variants],
              request_options: Anthropic::RequestOpts
            ).void
          end
          def initialize(betas: nil, request_options: {}); end

          sig { returns(Anthropic::Models::Beta::Messages::BatchCancelParams::Shape) }
          def to_h; end
        end
      end
    end
  end
end
