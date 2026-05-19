# typed: strong

module Anthropic
  module Models
    module Beta
      module Environments
        class WorkHeartbeatParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Environments::WorkHeartbeatParams,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :environment_id

          sig { returns(String) }
          attr_accessor :work_id

          # Desired TTL in seconds
          sig { returns(T.nilable(Integer)) }
          attr_accessor :desired_ttl_seconds

          # Expected last_heartbeat for conditional update (optimistic concurrency). Use
          # literal 'NO_HEARTBEAT' to claim an unclaimed lease (first heartbeat). For
          # subsequent heartbeats, echo the server's previous last_heartbeat value exactly.
          # Returns 412 Precondition Failed if the actual value doesn't match.
          sig { returns(T.nilable(String)) }
          attr_accessor :expected_last_heartbeat

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
              environment_id: String,
              work_id: String,
              desired_ttl_seconds: T.nilable(Integer),
              expected_last_heartbeat: T.nilable(String),
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            environment_id:,
            work_id:,
            # Desired TTL in seconds
            desired_ttl_seconds: nil,
            # Expected last_heartbeat for conditional update (optimistic concurrency). Use
            # literal 'NO_HEARTBEAT' to claim an unclaimed lease (first heartbeat). For
            # subsequent heartbeats, echo the server's previous last_heartbeat value exactly.
            # Returns 412 Precondition Failed if the actual value doesn't match.
            expected_last_heartbeat: nil,
            # Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                environment_id: String,
                work_id: String,
                desired_ttl_seconds: T.nilable(Integer),
                expected_last_heartbeat: T.nilable(String),
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
end
