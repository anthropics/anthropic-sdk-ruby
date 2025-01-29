# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BatchListParams < Anthropic::BaseModel
          extend Anthropic::RequestParameters::Converter
          include Anthropic::RequestParameters

          Shape = T.type_alias do
            T.all(
              {
                after_id: String,
                before_id: String,
                limit: Integer,
                betas: T::Array[Anthropic::Models::AnthropicBeta::Variants]
              },
              Anthropic::RequestParameters::Shape
            )
          end

          sig { returns(T.nilable(String)) }
          attr_reader :after_id

          sig { params(after_id: String).void }
          attr_writer :after_id

          sig { returns(T.nilable(String)) }
          attr_reader :before_id

          sig { params(before_id: String).void }
          attr_writer :before_id

          sig { returns(T.nilable(Integer)) }
          attr_reader :limit

          sig { params(limit: Integer).void }
          attr_writer :limit

          sig { returns(T::Array[Anthropic::Models::AnthropicBeta::Variants]) }
          attr_reader :betas

          sig { params(betas: T::Array[Anthropic::Models::AnthropicBeta::Variants]).void }
          attr_writer :betas

          sig do
            params(
              after_id: String,
              before_id: String,
              limit: Integer,
              betas: T::Array[Anthropic::Models::AnthropicBeta::Variants],
              request_options: Anthropic::RequestOpts
            ).void
          end
          def initialize(after_id: nil, before_id: nil, limit: nil, betas: nil, request_options: {}); end

          sig { returns(Anthropic::Models::Beta::Messages::BatchListParams::Shape) }
          def to_h; end
        end
      end
    end
  end
end
