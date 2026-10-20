# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class WebhookListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::WebhookListParams,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the object to use as a cursor for pagination. When provided, returns the
          # page of results immediately after this object.
          sig { returns(T.nilable(String)) }
          attr_accessor :after_id

          # ID of a webhook endpoint to use as a cursor. Returns the first `limit` endpoints
          # that come before it in list order, not the `limit` endpoints just before it.
          sig { returns(T.nilable(String)) }
          attr_accessor :before_id

          # Number of items to return per page, up to `100`. The default, `0`, means `20`.
          sig { returns(T.nilable(Integer)) }
          attr_reader :limit

          sig { params(limit: Integer).void }
          attr_writer :limit

          # Sort order by `created_at`. Defaults to `desc`, newest first.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::WebhookListParams::Order::OrSymbol
              )
            )
          end
          attr_accessor :order

          # This endpoint is in beta: requests must send `webhooks-2026-10-07` in this
          # header.
          sig do
            returns(
              T.nilable(
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
              )
            )
          end
          attr_reader :betas

          sig do
            params(
              betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
            ).void
          end
          attr_writer :betas

          sig do
            params(
              after_id: T.nilable(String),
              before_id: T.nilable(String),
              limit: Integer,
              order:
                T.nilable(
                  Anthropic::Beta::Organization::WebhookListParams::Order::OrSymbol
                ),
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # ID of the object to use as a cursor for pagination. When provided, returns the
            # page of results immediately after this object.
            after_id: nil,
            # ID of a webhook endpoint to use as a cursor. Returns the first `limit` endpoints
            # that come before it in list order, not the `limit` endpoints just before it.
            before_id: nil,
            # Number of items to return per page, up to `100`. The default, `0`, means `20`.
            limit: nil,
            # Sort order by `created_at`. Defaults to `desc`, newest first.
            order: nil,
            # This endpoint is in beta: requests must send `webhooks-2026-10-07` in this
            # header.
            betas: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                after_id: T.nilable(String),
                before_id: T.nilable(String),
                limit: Integer,
                order:
                  T.nilable(
                    Anthropic::Beta::Organization::WebhookListParams::Order::OrSymbol
                  ),
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions
              }
            )
          end
          def to_hash
          end

          # Sort order by `created_at`. Defaults to `desc`, newest first.
          module Order
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::WebhookListParams::Order
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ASC =
              T.let(
                :asc,
                Anthropic::Beta::Organization::WebhookListParams::Order::TaggedSymbol
              )
            DESC =
              T.let(
                :desc,
                Anthropic::Beta::Organization::WebhookListParams::Order::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::WebhookListParams::Order::TaggedSymbol
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
end
