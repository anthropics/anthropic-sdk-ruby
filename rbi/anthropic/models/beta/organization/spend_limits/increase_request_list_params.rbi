# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module SpendLimits
          class IncreaseRequestListParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::SpendLimits::IncreaseRequestListParams,
                  Anthropic::Internal::AnyHash
                )
              end

            # Filter by requester, as `user_...` tagged IDs.
            sig { returns(T.nilable(T::Array[String])) }
            attr_accessor :actor_ids

            sig { returns(T.nilable(Integer)) }
            attr_reader :limit

            sig { params(limit: Integer).void }
            attr_writer :limit

            # Opaque cursor from a previous response's `next_page`.
            sig { returns(T.nilable(String)) }
            attr_accessor :page

            # Filter by status. Omit to return all.
            sig do
              returns(
                T.nilable(
                  T::Array[
                    Anthropic::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestStatus::OrSymbol
                  ]
                )
              )
            end
            attr_accessor :status

            sig do
              params(
                actor_ids: T.nilable(T::Array[String]),
                limit: Integer,
                page: T.nilable(String),
                status:
                  T.nilable(
                    T::Array[
                      Anthropic::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestStatus::OrSymbol
                    ]
                  ),
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # Filter by requester, as `user_...` tagged IDs.
              actor_ids: nil,
              limit: nil,
              # Opaque cursor from a previous response's `next_page`.
              page: nil,
              # Filter by status. Omit to return all.
              status: nil,
              request_options: {}
            )
            end

            sig do
              override.returns(
                {
                  actor_ids: T.nilable(T::Array[String]),
                  limit: Integer,
                  page: T.nilable(String),
                  status:
                    T.nilable(
                      T::Array[
                        Anthropic::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestStatus::OrSymbol
                      ]
                    ),
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
