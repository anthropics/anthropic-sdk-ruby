# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BatchListParams < Anthropic::BaseModel
          extend Anthropic::Type::RequestParameters::Converter
          include Anthropic::RequestParameters

          # ID of the object to use as a cursor for pagination. When provided, returns the
          #   page of results immediately after this object.
          sig { returns(T.nilable(String)) }
          attr_reader :after_id

          sig { params(after_id: String).void }
          attr_writer :after_id

          # ID of the object to use as a cursor for pagination. When provided, returns the
          #   page of results immediately before this object.
          sig { returns(T.nilable(String)) }
          attr_reader :before_id

          sig { params(before_id: String).void }
          attr_writer :before_id

          # Number of items to return per page.
          #
          #   Defaults to `20`. Ranges from `1` to `1000`.
          sig { returns(T.nilable(Integer)) }
          attr_reader :limit

          sig { params(limit: Integer).void }
          attr_writer :limit

          # Optional header to specify the beta version(s) you want to use.
          sig { returns(T.nilable(T::Array[T.any(String, Anthropic::Models::AnthropicBeta::OrSymbol)])) }
          attr_reader :betas

          sig { params(betas: T::Array[T.any(String, Anthropic::Models::AnthropicBeta::OrSymbol)]).void }
          attr_writer :betas

          sig do
            params(
              after_id: String,
              before_id: String,
              limit: Integer,
              betas: T::Array[T.any(String, Anthropic::Models::AnthropicBeta::OrSymbol)],
              request_options: T.any(Anthropic::RequestOptions, Anthropic::Util::AnyHash)
            )
              .returns(T.attached_class)
          end
          def self.new(after_id: nil, before_id: nil, limit: nil, betas: nil, request_options: {})
          end

          sig do
            override
              .returns(
                {
                  after_id: String,
                  before_id: String,
                  limit: Integer,
                  betas: T::Array[T.any(String, Anthropic::Models::AnthropicBeta::OrSymbol)],
                  request_options: Anthropic::RequestOptions
                }
              )
          end
          def to_hash
          end
        end
      end
    end
  end
end
