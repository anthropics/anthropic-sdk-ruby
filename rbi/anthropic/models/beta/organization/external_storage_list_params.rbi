# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class ExternalStorageListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::ExternalStorageListParams,
                Anthropic::Internal::AnyHash
              )
            end

          # Number of results per page.
          sig { returns(T.nilable(Integer)) }
          attr_reader :limit

          sig { params(limit: Integer).void }
          attr_writer :limit

          # Opaque cursor from a previous response's `next_page`.
          sig { returns(T.nilable(String)) }
          attr_accessor :page

          # Returns only External Storage bound to one of these user profile IDs
          # (`uprof_...`). An empty entry matches storage bound to no user profile. At most
          # 10 entries, counting repeats.
          sig { returns(T.nilable(T::Array[String])) }
          attr_accessor :user_profile_ids

          # This endpoint is in beta: requests must send `efs-2026-10-01` in this header.
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
              limit: Integer,
              page: T.nilable(String),
              user_profile_ids: T.nilable(T::Array[String]),
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Number of results per page.
            limit: nil,
            # Opaque cursor from a previous response's `next_page`.
            page: nil,
            # Returns only External Storage bound to one of these user profile IDs
            # (`uprof_...`). An empty entry matches storage bound to no user profile. At most
            # 10 entries, counting repeats.
            user_profile_ids: nil,
            # This endpoint is in beta: requests must send `efs-2026-10-01` in this header.
            betas: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                limit: Integer,
                page: T.nilable(String),
                user_profile_ids: T.nilable(T::Array[String]),
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
