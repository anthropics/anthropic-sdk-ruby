# typed: strong

module Anthropic
  module Models
    module Beta
      class UserProfileListParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::UserProfileListParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Query parameter for limit
        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        # Query parameter for order
        sig do
          returns(
            T.nilable(Anthropic::Beta::UserProfileListParams::Order::OrSymbol)
          )
        end
        attr_reader :order

        sig do
          params(
            order: Anthropic::Beta::UserProfileListParams::Order::OrSymbol
          ).void
        end
        attr_writer :order

        # Query parameter for order_by
        sig do
          returns(
            T.nilable(Anthropic::Beta::UserProfileListParams::OrderBy::OrSymbol)
          )
        end
        attr_reader :order_by

        sig do
          params(
            order_by: Anthropic::Beta::UserProfileListParams::OrderBy::OrSymbol
          ).void
        end
        attr_writer :order_by

        # Query parameter for page
        sig { returns(T.nilable(String)) }
        attr_reader :page

        sig { params(page: String).void }
        attr_writer :page

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
            limit: Integer,
            order: Anthropic::Beta::UserProfileListParams::Order::OrSymbol,
            order_by: Anthropic::Beta::UserProfileListParams::OrderBy::OrSymbol,
            page: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Query parameter for limit
          limit: nil,
          # Query parameter for order
          order: nil,
          # Query parameter for order_by
          order_by: nil,
          # Query parameter for page
          page: nil,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              limit: Integer,
              order: Anthropic::Beta::UserProfileListParams::Order::OrSymbol,
              order_by:
                Anthropic::Beta::UserProfileListParams::OrderBy::OrSymbol,
              page: String,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions
            }
          )
        end
        def to_hash
        end

        # Query parameter for order
        module Order
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::UserProfileListParams::Order)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ASC =
            T.let(
              :asc,
              Anthropic::Beta::UserProfileListParams::Order::TaggedSymbol
            )
          DESC =
            T.let(
              :desc,
              Anthropic::Beta::UserProfileListParams::Order::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::UserProfileListParams::Order::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Query parameter for order_by
        module OrderBy
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::UserProfileListParams::OrderBy)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CREATED_AT =
            T.let(
              :created_at,
              Anthropic::Beta::UserProfileListParams::OrderBy::TaggedSymbol
            )
          NAME =
            T.let(
              :name,
              Anthropic::Beta::UserProfileListParams::OrderBy::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::UserProfileListParams::OrderBy::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
