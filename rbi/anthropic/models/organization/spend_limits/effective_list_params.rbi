# typed: strong

module Anthropic
  module Models
    module Organization
      module SpendLimits
        class EffectiveListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Organization::SpendLimits::EffectiveListParams,
                Anthropic::Internal::AnyHash
              )
            end

          # Maximum number of members per page. A member's period rows never split across
          # pages, so a page may carry more rows than this. Defaults to `20`.
          sig { returns(T.nilable(Integer)) }
          attr_reader :limit

          sig { params(limit: Integer).void }
          attr_writer :limit

          # Opaque cursor from a previous response's `next_page` field.
          sig { returns(T.nilable(String)) }
          attr_accessor :page

          # Restrict the report to these limit periods. Omit to return one row per period
          # each member resolves a spend limit for.
          sig do
            returns(
              T.nilable(
                T::Array[Anthropic::Organization::SpendLimitPeriod::OrSymbol]
              )
            )
          end
          attr_accessor :period

          # Restrict the report to these members, by tagged user ID (`user_...`). At most
          # 100 entries.
          sig { returns(T.nilable(T::Array[String])) }
          attr_accessor :user_ids

          sig do
            params(
              limit: Integer,
              page: T.nilable(String),
              period:
                T.nilable(
                  T::Array[Anthropic::Organization::SpendLimitPeriod::OrSymbol]
                ),
              user_ids: T.nilable(T::Array[String]),
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Maximum number of members per page. A member's period rows never split across
            # pages, so a page may carry more rows than this. Defaults to `20`.
            limit: nil,
            # Opaque cursor from a previous response's `next_page` field.
            page: nil,
            # Restrict the report to these limit periods. Omit to return one row per period
            # each member resolves a spend limit for.
            period: nil,
            # Restrict the report to these members, by tagged user ID (`user_...`). At most
            # 100 entries.
            user_ids: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                limit: Integer,
                page: T.nilable(String),
                period:
                  T.nilable(
                    T::Array[
                      Anthropic::Organization::SpendLimitPeriod::OrSymbol
                    ]
                  ),
                user_ids: T.nilable(T::Array[String]),
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
