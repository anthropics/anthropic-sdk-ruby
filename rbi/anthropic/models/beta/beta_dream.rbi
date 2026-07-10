# typed: strong

module Anthropic
  module Models
    BetaDream = Beta::BetaDream

    module Beta
      class BetaDream < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Anthropic::Beta::BetaDream, Anthropic::Internal::AnyHash)
          end

        sig { returns(String) }
        attr_accessor :id

        # A timestamp in RFC 3339 format
        sig { returns(T.nilable(Time)) }
        attr_accessor :archived_at

        # A timestamp in RFC 3339 format
        sig { returns(Time) }
        attr_accessor :created_at

        # A timestamp in RFC 3339 format
        sig { returns(T.nilable(Time)) }
        attr_accessor :ended_at

        # Failure detail for a Dream whose `status` is `failed`.
        sig { returns(T.nilable(Anthropic::Beta::BetaDreamError)) }
        attr_reader :error

        sig do
          params(error: T.nilable(Anthropic::Beta::BetaDreamError::OrHash)).void
        end
        attr_writer :error

        sig { returns(T::Array[Anthropic::Beta::BetaDreamInput::Variants]) }
        attr_accessor :inputs

        sig { returns(T.nilable(String)) }
        attr_accessor :instructions

        # Model identifier and configuration applied to every pipeline stage. Same wire
        # shape as the Agents API ModelConfig.
        sig { returns(Anthropic::Beta::BetaDreamModelConfig) }
        attr_reader :model

        sig do
          params(model: Anthropic::Beta::BetaDreamModelConfig::OrHash).void
        end
        attr_writer :model

        sig { returns(T::Array[Anthropic::Beta::BetaDreamOutput]) }
        attr_accessor :outputs

        sig { returns(T.nilable(String)) }
        attr_accessor :session_id

        # Lifecycle status of a Dream.
        sig { returns(Anthropic::Beta::BetaDreamStatus::TaggedSymbol) }
        attr_accessor :status

        sig { returns(Anthropic::Beta::BetaDream::Type::TaggedSymbol) }
        attr_accessor :type

        # Cumulative token usage for the dream across every pipeline stage.
        sig { returns(Anthropic::Beta::BetaDreamUsage) }
        attr_reader :usage

        sig { params(usage: Anthropic::Beta::BetaDreamUsage::OrHash).void }
        attr_writer :usage

        # An asynchronous memory-consolidation job that reads a memory store plus a set of
        # session transcripts and writes consolidated memories into a new output memory
        # store. The Dreams API is in research preview: the request and response shapes
        # are volatile and may change without the deprecation period that applies to
        # generally-available endpoints.
        sig do
          params(
            id: String,
            archived_at: T.nilable(Time),
            created_at: Time,
            ended_at: T.nilable(Time),
            error: T.nilable(Anthropic::Beta::BetaDreamError::OrHash),
            inputs:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaDreamMemoryStoreInput::OrHash,
                  Anthropic::Beta::BetaDreamSessionsInput::OrHash
                )
              ],
            instructions: T.nilable(String),
            model: Anthropic::Beta::BetaDreamModelConfig::OrHash,
            outputs: T::Array[Anthropic::Beta::BetaDreamOutput::OrHash],
            session_id: T.nilable(String),
            status: Anthropic::Beta::BetaDreamStatus::OrSymbol,
            type: Anthropic::Beta::BetaDream::Type::OrSymbol,
            usage: Anthropic::Beta::BetaDreamUsage::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          # A timestamp in RFC 3339 format
          archived_at:,
          # A timestamp in RFC 3339 format
          created_at:,
          # A timestamp in RFC 3339 format
          ended_at:,
          # Failure detail for a Dream whose `status` is `failed`.
          error:,
          inputs:,
          instructions:,
          # Model identifier and configuration applied to every pipeline stage. Same wire
          # shape as the Agents API ModelConfig.
          model:,
          outputs:,
          session_id:,
          # Lifecycle status of a Dream.
          status:,
          type:,
          # Cumulative token usage for the dream across every pipeline stage.
          usage:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              archived_at: T.nilable(Time),
              created_at: Time,
              ended_at: T.nilable(Time),
              error: T.nilable(Anthropic::Beta::BetaDreamError),
              inputs: T::Array[Anthropic::Beta::BetaDreamInput::Variants],
              instructions: T.nilable(String),
              model: Anthropic::Beta::BetaDreamModelConfig,
              outputs: T::Array[Anthropic::Beta::BetaDreamOutput],
              session_id: T.nilable(String),
              status: Anthropic::Beta::BetaDreamStatus::TaggedSymbol,
              type: Anthropic::Beta::BetaDream::Type::TaggedSymbol,
              usage: Anthropic::Beta::BetaDreamUsage
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Anthropic::Beta::BetaDream::Type) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DREAM = T.let(:dream, Anthropic::Beta::BetaDream::Type::TaggedSymbol)

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaDream::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
