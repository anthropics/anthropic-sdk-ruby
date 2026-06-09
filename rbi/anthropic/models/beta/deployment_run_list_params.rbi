# typed: strong

module Anthropic
  module Models
    module Beta
      class DeploymentRunListParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::DeploymentRunListParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Return runs created strictly after this time (exclusive).
        sig { returns(T.nilable(Time)) }
        attr_reader :created_at_gt

        sig { params(created_at_gt: Time).void }
        attr_writer :created_at_gt

        # Return runs created at or after this time (inclusive).
        sig { returns(T.nilable(Time)) }
        attr_reader :created_at_gte

        sig { params(created_at_gte: Time).void }
        attr_writer :created_at_gte

        # Return runs created strictly before this time (exclusive).
        sig { returns(T.nilable(Time)) }
        attr_reader :created_at_lt

        sig { params(created_at_lt: Time).void }
        attr_writer :created_at_lt

        # Return runs created at or before this time (inclusive).
        sig { returns(T.nilable(Time)) }
        attr_reader :created_at_lte

        sig { params(created_at_lte: Time).void }
        attr_writer :created_at_lte

        # Filter to a specific deployment. Omit to list across all deployments in the
        # workspace. Filtering by a non-existent deployment_id returns 200 with empty
        # data.
        sig { returns(T.nilable(String)) }
        attr_reader :deployment_id

        sig { params(deployment_id: String).void }
        attr_writer :deployment_id

        # Filter: true for runs with non-null error, false for runs with non-null
        # session_id. Omit for all.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :has_error

        sig { params(has_error: T::Boolean).void }
        attr_writer :has_error

        # Maximum results per page. Default 20, maximum 1000.
        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        # Opaque pagination cursor. Pass next_page from the previous response. Invalid or
        # expired cursors return 400.
        sig { returns(T.nilable(String)) }
        attr_reader :page

        sig { params(page: String).void }
        attr_writer :page

        # Filter runs by what triggered them. Omit to return all runs.
        sig do
          returns(
            T.nilable(Anthropic::Beta::BetaManagedAgentsTriggerType::OrSymbol)
          )
        end
        attr_reader :trigger_type

        sig do
          params(
            trigger_type:
              Anthropic::Beta::BetaManagedAgentsTriggerType::OrSymbol
          ).void
        end
        attr_writer :trigger_type

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
            created_at_gte: Time,
            created_at_lt: Time,
            created_at_lte: Time,
            deployment_id: String,
            has_error: T::Boolean,
            limit: Integer,
            page: String,
            trigger_type:
              Anthropic::Beta::BetaManagedAgentsTriggerType::OrSymbol,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Return runs created strictly after this time (exclusive).
          created_at_gt: nil,
          # Return runs created at or after this time (inclusive).
          created_at_gte: nil,
          # Return runs created strictly before this time (exclusive).
          created_at_lt: nil,
          # Return runs created at or before this time (inclusive).
          created_at_lte: nil,
          # Filter to a specific deployment. Omit to list across all deployments in the
          # workspace. Filtering by a non-existent deployment_id returns 200 with empty
          # data.
          deployment_id: nil,
          # Filter: true for runs with non-null error, false for runs with non-null
          # session_id. Omit for all.
          has_error: nil,
          # Maximum results per page. Default 20, maximum 1000.
          limit: nil,
          # Opaque pagination cursor. Pass next_page from the previous response. Invalid or
          # expired cursors return 400.
          page: nil,
          # Filter runs by what triggered them. Omit to return all runs.
          trigger_type: nil,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              created_at_gt: Time,
              created_at_gte: Time,
              created_at_lt: Time,
              created_at_lte: Time,
              deployment_id: String,
              has_error: T::Boolean,
              limit: Integer,
              page: String,
              trigger_type:
                Anthropic::Beta::BetaManagedAgentsTriggerType::OrSymbol,
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
