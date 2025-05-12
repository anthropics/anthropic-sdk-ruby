# typed: strong

module Anthropic
  module Models
    module Beta
      class ModelListParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::ModelListParams,
              Anthropic::Internal::AnyHash
            )
          end

        # ID of the object to use as a cursor for pagination. When provided, returns the
        # page of results immediately after this object.
        sig { returns(T.nilable(String)) }
        attr_reader :after_id

        sig { params(after_id: String).void }
        attr_writer :after_id

        # ID of the object to use as a cursor for pagination. When provided, returns the
        # page of results immediately before this object.
        sig { returns(T.nilable(String)) }
        attr_reader :before_id

        sig { params(before_id: String).void }
        attr_writer :before_id

        # Number of items to return per page.
        #
        # Defaults to `20`. Ranges from `1` to `1000`.
        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        # Optional header to specify the beta version(s) you want to use.
        sig do
          returns(
            T.nilable(
              T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)]
            )
          )
        end
        attr_reader :betas

        sig do
          params(
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)]
          ).void
        end
        attr_writer :betas

        sig do
          params(
            after_id: String,
            before_id: String,
            limit: Integer,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # ID of the object to use as a cursor for pagination. When provided, returns the
          # page of results immediately after this object.
          after_id: nil,
          # ID of the object to use as a cursor for pagination. When provided, returns the
          # page of results immediately before this object.
          before_id: nil,
          # Number of items to return per page.
          #
          # Defaults to `20`. Ranges from `1` to `1000`.
          limit: nil,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              after_id: String,
              before_id: String,
              limit: Integer,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
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
