# typed: strong

module Anthropic
  module Models
    module Beta
      module Environments
        class WorkPollParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Environments::WorkPollParams,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :environment_id

          # How long to wait for work to arrive before returning. Must be 1-999 in
          # milliseconds. Defaults to non-blocking (returns immediately if no work is
          # available).
          sig { returns(T.nilable(Integer)) }
          attr_accessor :block_ms

          # Reclaim unacknowledged work items older than this many milliseconds. If omitted,
          # uses the default (5000ms).
          sig { returns(T.nilable(Integer)) }
          attr_accessor :reclaim_older_than_ms

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

          # Unique identifier for the specific worker polling, used to track aggregated
          # environment-level work metrics in Console
          sig { returns(T.nilable(String)) }
          attr_reader :anthropic_worker_id

          sig { params(anthropic_worker_id: String).void }
          attr_writer :anthropic_worker_id

          sig do
            params(
              environment_id: String,
              block_ms: T.nilable(Integer),
              reclaim_older_than_ms: T.nilable(Integer),
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              anthropic_worker_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            environment_id:,
            # How long to wait for work to arrive before returning. Must be 1-999 in
            # milliseconds. Defaults to non-blocking (returns immediately if no work is
            # available).
            block_ms: nil,
            # Reclaim unacknowledged work items older than this many milliseconds. If omitted,
            # uses the default (5000ms).
            reclaim_older_than_ms: nil,
            # Optional header to specify the beta version(s) you want to use.
            betas: nil,
            # Unique identifier for the specific worker polling, used to track aggregated
            # environment-level work metrics in Console
            anthropic_worker_id: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                environment_id: String,
                block_ms: T.nilable(Integer),
                reclaim_older_than_ms: T.nilable(Integer),
                betas:
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
                anthropic_worker_id: String,
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
