# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BatchListParams < Anthropic::BaseModel
          extend Anthropic::RequestParameters::Converter
          include Anthropic::RequestParameters

          sig { returns(T.nilable(String)) }
          def after_id
          end

          sig { params(_: String).returns(String) }
          def after_id=(_)
          end

          sig { returns(T.nilable(String)) }
          def before_id
          end

          sig { params(_: String).returns(String) }
          def before_id=(_)
          end

          sig { returns(T.nilable(Integer)) }
          def limit
          end

          sig { params(_: Integer).returns(Integer) }
          def limit=(_)
          end

          sig { returns(T.nilable(T::Array[T.any(String, Symbol)])) }
          def betas
          end

          sig { params(_: T::Array[T.any(String, Symbol)]).returns(T::Array[T.any(String, Symbol)]) }
          def betas=(_)
          end

          sig do
            params(
              after_id: String,
              before_id: String,
              limit: Integer,
              betas: T::Array[T.any(String, Symbol)],
              request_options: T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything])
            ).void
          end
          def initialize(after_id: nil, before_id: nil, limit: nil, betas: nil, request_options: {})
          end

          sig do
            override.returns(
              {
                after_id: String,
                before_id: String,
                limit: Integer,
                betas: T::Array[T.any(String, Symbol)],
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
