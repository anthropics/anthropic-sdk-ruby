# typed: strong

module Anthropic
  module Models
    module Beta
      class DeploymentListParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::DeploymentListParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Filter by agent ID.
        sig { returns(T.nilable(String)) }
        attr_reader :agent_id

        sig { params(agent_id: String).void }
        attr_writer :agent_id

        # Return deployments created at or after this time (inclusive).
        sig { returns(T.nilable(Time)) }
        attr_reader :created_at_gte

        sig { params(created_at_gte: Time).void }
        attr_writer :created_at_gte

        # Return deployments created at or before this time (inclusive).
        sig { returns(T.nilable(Time)) }
        attr_reader :created_at_lte

        sig { params(created_at_lte: Time).void }
        attr_writer :created_at_lte

        # When true, includes archived deployments. Default: false (exclude archived).
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_archived

        sig { params(include_archived: T::Boolean).void }
        attr_writer :include_archived

        # Maximum results per page. Default 20, maximum 100.
        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        # Opaque pagination cursor.
        sig { returns(T.nilable(String)) }
        attr_reader :page

        sig { params(page: String).void }
        attr_writer :page

        # Filter by status: active or paused. Omit for both. To include archived
        # deployments, use include_archived instead; the two cannot be combined.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaManagedAgentsDeploymentStatus::OrSymbol
            )
          )
        end
        attr_reader :status

        sig do
          params(
            status: Anthropic::Beta::BetaManagedAgentsDeploymentStatus::OrSymbol
          ).void
        end
        attr_writer :status

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
            agent_id: String,
            created_at_gte: Time,
            created_at_lte: Time,
            include_archived: T::Boolean,
            limit: Integer,
            page: String,
            status:
              Anthropic::Beta::BetaManagedAgentsDeploymentStatus::OrSymbol,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Filter by agent ID.
          agent_id: nil,
          # Return deployments created at or after this time (inclusive).
          created_at_gte: nil,
          # Return deployments created at or before this time (inclusive).
          created_at_lte: nil,
          # When true, includes archived deployments. Default: false (exclude archived).
          include_archived: nil,
          # Maximum results per page. Default 20, maximum 100.
          limit: nil,
          # Opaque pagination cursor.
          page: nil,
          # Filter by status: active or paused. Omit for both. To include archived
          # deployments, use include_archived instead; the two cannot be combined.
          status: nil,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              agent_id: String,
              created_at_gte: Time,
              created_at_lte: Time,
              include_archived: T::Boolean,
              limit: Integer,
              page: String,
              status:
                Anthropic::Beta::BetaManagedAgentsDeploymentStatus::OrSymbol,
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
