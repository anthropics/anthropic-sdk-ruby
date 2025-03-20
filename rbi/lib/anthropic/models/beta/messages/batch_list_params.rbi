# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BatchListParams < Anthropic::BaseModel
          extend Anthropic::RequestParameters::Converter
          include Anthropic::RequestParameters

          # ID of the object to use as a cursor for pagination. When provided, returns the
          #   page of results immediately after this object.
          sig { returns(T.nilable(String)) }
          def after_id
          end

          sig { params(_: String).returns(String) }
          def after_id=(_)
          end

          # ID of the object to use as a cursor for pagination. When provided, returns the
          #   page of results immediately before this object.
          sig { returns(T.nilable(String)) }
          def before_id
          end

          sig { params(_: String).returns(String) }
          def before_id=(_)
          end

          # Number of items to return per page.
          #
          #   Defaults to `20`. Ranges from `1` to `1000`.
          sig { returns(T.nilable(Integer)) }
          def limit
          end

          sig { params(_: Integer).returns(Integer) }
          def limit=(_)
          end

          # Optional header to specify the beta version(s) you want to use.
          sig { returns(T.nilable(T::Array[T.any(String, Anthropic::Models::AnthropicBeta::OrSymbol)])) }
          def betas
          end

          sig do
            params(_: T::Array[T.any(String, Anthropic::Models::AnthropicBeta::OrSymbol)])
              .returns(T::Array[T.any(String, Anthropic::Models::AnthropicBeta::OrSymbol)])
          end
          def betas=(_)
          end

          sig do
            params(
              after_id: String,
              before_id: String,
              limit: Integer,
              betas: T::Array[T.any(String, Anthropic::Models::AnthropicBeta::OrSymbol)],
              request_options: T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything])
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
