# typed: strong

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class NoticeListParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Compliance::Review::NoticeListParams,
                  Anthropic::Internal::AnyHash
                )
              end

            # Return only notices whose `case_ids` include this case (`rvc_...`). A case that
            # the API key can't read returns an empty list.
            sig { returns(T.nilable(String)) }
            attr_reader :case_id

            sig { params(case_id: String).void }
            attr_writer :case_id

            # Return only notices whose `created_at` is after this time.
            sig { returns(T.nilable(Time)) }
            attr_reader :created_at_gt

            sig { params(created_at_gt: Time).void }
            attr_writer :created_at_gt

            # Return notices whose `created_at` is at or after this time. Notices slightly
            # older than this time are also returned, so that a poll misses no notice.
            sig { returns(T.nilable(Time)) }
            attr_reader :created_at_gte

            sig { params(created_at_gte: Time).void }
            attr_writer :created_at_gte

            # Return only notices whose `created_at` is before this time.
            sig { returns(T.nilable(Time)) }
            attr_reader :created_at_lt

            sig { params(created_at_lt: Time).void }
            attr_writer :created_at_lt

            # Return only notices whose `created_at` is at or before this time.
            sig { returns(T.nilable(Time)) }
            attr_reader :created_at_lte

            sig { params(created_at_lte: Time).void }
            attr_writer :created_at_lte

            # Number of notices to return per page, between 1 and 100. Defaults to 20.
            sig { returns(T.nilable(Integer)) }
            attr_reader :limit

            sig { params(limit: Integer).void }
            attr_writer :limit

            # Sort direction, by `created_at` and then by `id`. Defaults to `desc`.
            sig do
              returns(
                T.nilable(
                  Anthropic::Beta::Compliance::BetaComplianceReviewOrder::OrSymbol
                )
              )
            end
            attr_reader :order

            sig do
              params(
                order:
                  Anthropic::Beta::Compliance::BetaComplianceReviewOrder::OrSymbol
              ).void
            end
            attr_writer :order

            # Opaque cursor from a previous response's `next_page`. Leave it out to get the
            # first page. A cursor works only with the filters and sort order of the request
            # that returned it.
            sig { returns(T.nilable(String)) }
            attr_reader :page

            sig { params(page: String).void }
            attr_writer :page

            # Optional header to specify the beta version(s) you want to use.
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
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
              ).void
            end
            attr_writer :betas

            sig do
              params(
                case_id: String,
                created_at_gt: Time,
                created_at_gte: Time,
                created_at_lt: Time,
                created_at_lte: Time,
                limit: Integer,
                order:
                  Anthropic::Beta::Compliance::BetaComplianceReviewOrder::OrSymbol,
                page: String,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # Return only notices whose `case_ids` include this case (`rvc_...`). A case that
              # the API key can't read returns an empty list.
              case_id: nil,
              # Return only notices whose `created_at` is after this time.
              created_at_gt: nil,
              # Return notices whose `created_at` is at or after this time. Notices slightly
              # older than this time are also returned, so that a poll misses no notice.
              created_at_gte: nil,
              # Return only notices whose `created_at` is before this time.
              created_at_lt: nil,
              # Return only notices whose `created_at` is at or before this time.
              created_at_lte: nil,
              # Number of notices to return per page, between 1 and 100. Defaults to 20.
              limit: nil,
              # Sort direction, by `created_at` and then by `id`. Defaults to `desc`.
              order: nil,
              # Opaque cursor from a previous response's `next_page`. Leave it out to get the
              # first page. A cursor works only with the filters and sort order of the request
              # that returned it.
              page: nil,
              # Optional header to specify the beta version(s) you want to use.
              betas: nil,
              request_options: {}
            )
            end

            sig do
              override.returns(
                {
                  case_id: String,
                  created_at_gt: Time,
                  created_at_gte: Time,
                  created_at_lt: Time,
                  created_at_lte: Time,
                  limit: Integer,
                  order:
                    Anthropic::Beta::Compliance::BetaComplianceReviewOrder::OrSymbol,
                  page: String,
                  betas:
                    T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
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
end
