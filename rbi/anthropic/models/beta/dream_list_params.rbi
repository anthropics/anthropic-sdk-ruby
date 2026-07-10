# typed: strong

module Anthropic
  module Models
    module Beta
      class DreamListParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::DreamListParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Return dreams with `created_at` strictly after this timestamp (exclusive lower
        # bound, RFC 3339). Unset applies no lower bound.
        sig { returns(T.nilable(Time)) }
        attr_reader :created_at_gt

        sig { params(created_at_gt: Time).void }
        attr_writer :created_at_gt

        # Return dreams with `created_at` strictly before this timestamp (exclusive upper
        # bound, RFC 3339). Unset applies no upper bound.
        sig { returns(T.nilable(Time)) }
        attr_reader :created_at_lt

        sig { params(created_at_lt: Time).void }
        attr_writer :created_at_lt

        # Query parameter for include_archived
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_archived

        sig { params(include_archived: T::Boolean).void }
        attr_writer :include_archived

        # Query parameter for limit
        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        # Query parameter for page
        sig { returns(T.nilable(String)) }
        attr_reader :page

        sig { params(page: String).void }
        attr_writer :page

        # Filter by lifecycle status. Repeat the parameter to match any of multiple
        # statuses. Empty applies no status filter.
        sig do
          returns(
            T.nilable(T::Array[Anthropic::Beta::BetaDreamStatus::OrSymbol])
          )
        end
        attr_reader :statuses

        sig do
          params(
            statuses: T::Array[Anthropic::Beta::BetaDreamStatus::OrSymbol]
          ).void
        end
        attr_writer :statuses

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
            created_at_gt: Time,
            created_at_lt: Time,
            include_archived: T::Boolean,
            limit: Integer,
            page: String,
            statuses: T::Array[Anthropic::Beta::BetaDreamStatus::OrSymbol],
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Return dreams with `created_at` strictly after this timestamp (exclusive lower
          # bound, RFC 3339). Unset applies no lower bound.
          created_at_gt: nil,
          # Return dreams with `created_at` strictly before this timestamp (exclusive upper
          # bound, RFC 3339). Unset applies no upper bound.
          created_at_lt: nil,
          # Query parameter for include_archived
          include_archived: nil,
          # Query parameter for limit
          limit: nil,
          # Query parameter for page
          page: nil,
          # Filter by lifecycle status. Repeat the parameter to match any of multiple
          # statuses. Empty applies no status filter.
          statuses: nil,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              created_at_gt: Time,
              created_at_lt: Time,
              include_archived: T::Boolean,
              limit: Integer,
              page: String,
              statuses: T::Array[Anthropic::Beta::BetaDreamStatus::OrSymbol],
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
