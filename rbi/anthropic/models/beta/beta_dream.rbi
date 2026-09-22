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

        # The unique ID of the dream (`drm_...`).
        sig { returns(String) }
        attr_accessor :id

        # When the dream was archived, in RFC 3339, or `null` if it hasn't been archived.
        sig { returns(T.nilable(Time)) }
        attr_accessor :archived_at

        # When the dream was created, in RFC 3339.
        #
        # Lists of dreams are sorted by this time, newest first.
        sig { returns(Time) }
        attr_accessor :created_at

        # When the dream reached `completed`, `failed`, or `canceled`, in RFC 3339, or
        # `null` if it is still `pending` or `running`.
        sig { returns(T.nilable(Time)) }
        attr_accessor :ended_at

        # Why the dream failed, or `null` if `status` isn't `failed`.
        sig { returns(T.nilable(Anthropic::Beta::BetaDreamError)) }
        attr_reader :error

        sig do
          params(error: T.nilable(Anthropic::Beta::BetaDreamError::OrHash)).void
        end
        attr_writer :error

        # The sources that the dream reads, from the request that created it.
        sig { returns(T::Array[Anthropic::Beta::BetaDreamInput::Variants]) }
        attr_accessor :inputs

        # The guidance given when the dream was created, or `null` if none was given.
        sig { returns(T.nilable(String)) }
        attr_accessor :instructions

        # The model that runs a dream, from the request that created it.
        #
        # The dream uses this model for all of its work. The response always gives the
        # model as an object, even if the request gave only a model ID.
        sig { returns(Anthropic::Beta::BetaDreamModelConfig) }
        attr_reader :model

        sig do
          params(model: Anthropic::Beta::BetaDreamModelConfig::OrHash).void
        end
        attr_writer :model

        # Where the dream writes its result, as set in the request that created the dream.
        # If that request left out `output_behavior`, the dream used the `create_new`
        # behavior.
        sig { returns(Anthropic::Beta::BetaOutputBehavior::Variants) }
        attr_accessor :output_behavior

        # The memory store that holds the dream's result, as a one-item array, or an empty
        # array until the dream records that memory store.
        #
        # The array is empty while the dream is `pending` and for a short time after it
        # starts `running`. It can stay empty if the dream fails or is canceled before
        # then. The memory store holds the complete result only once `status` is
        # `completed`.
        #
        # See the
        # [Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#use-the-output)
        # for how to review and use the result.
        sig { returns(T::Array[Anthropic::Beta::BetaDreamOutput]) }
        attr_accessor :outputs

        # The ID of the session that runs the dream (`sesn_...`), or `null` if that
        # session hasn't started.
        #
        # Stream that session's events to follow what the dream reads and writes.
        #
        # See the
        # [Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#watch-the-pipeline-run)
        # for how to watch a running dream.
        sig { returns(T.nilable(String)) }
        attr_accessor :session_id

        # Where a dream is in its lifecycle.
        #
        # `completed`, `failed`, and `canceled` are final: once a dream has one of these
        # statuses, its status doesn't change again.
        #
        # See the
        # [Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#lifecycle)
        # for what each status means.
        sig { returns(Anthropic::Beta::BetaDreamStatus::TaggedSymbol) }
        attr_accessor :status

        sig { returns(Anthropic::Beta::BetaDream::Type::TaggedSymbol) }
        attr_accessor :type

        # The dream's token counts, which stop changing once its `status` is `completed`
        # or `failed`. After a cancel, they can keep changing.
        sig { returns(Anthropic::Beta::BetaDreamUsage) }
        attr_reader :usage

        sig { params(usage: Anthropic::Beta::BetaDreamUsage::OrHash).void }
        attr_writer :usage

        # An asynchronous job that reads a memory store and past sessions, then writes a
        # reorganized version of that memory store.
        #
        # By default the dream writes its result to a new memory store and doesn't change
        # the input memory store. With `output_behavior` set to `update_existing`, it
        # writes its result into the input memory store instead.
        #
        # The Dreams API is in research preview: the request and response shapes are
        # volatile and may change without the deprecation period that applies to
        # generally-available endpoints.
        #
        # See the
        # [Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#how-it-works)
        # for what a dream reads and produces.
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
            output_behavior:
              T.any(
                Anthropic::Beta::BetaOutputBehaviorCreateNew::OrHash,
                Anthropic::Beta::BetaOutputBehaviorUpdateExisting::OrHash
              ),
            outputs: T::Array[Anthropic::Beta::BetaDreamOutput::OrHash],
            session_id: T.nilable(String),
            status: Anthropic::Beta::BetaDreamStatus::OrSymbol,
            type: Anthropic::Beta::BetaDream::Type::OrSymbol,
            usage: Anthropic::Beta::BetaDreamUsage::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The unique ID of the dream (`drm_...`).
          id:,
          # When the dream was archived, in RFC 3339, or `null` if it hasn't been archived.
          archived_at:,
          # When the dream was created, in RFC 3339.
          #
          # Lists of dreams are sorted by this time, newest first.
          created_at:,
          # When the dream reached `completed`, `failed`, or `canceled`, in RFC 3339, or
          # `null` if it is still `pending` or `running`.
          ended_at:,
          # Why the dream failed, or `null` if `status` isn't `failed`.
          error:,
          # The sources that the dream reads, from the request that created it.
          inputs:,
          # The guidance given when the dream was created, or `null` if none was given.
          instructions:,
          # The model that runs a dream, from the request that created it.
          #
          # The dream uses this model for all of its work. The response always gives the
          # model as an object, even if the request gave only a model ID.
          model:,
          # Where the dream writes its result, as set in the request that created the dream.
          # If that request left out `output_behavior`, the dream used the `create_new`
          # behavior.
          output_behavior:,
          # The memory store that holds the dream's result, as a one-item array, or an empty
          # array until the dream records that memory store.
          #
          # The array is empty while the dream is `pending` and for a short time after it
          # starts `running`. It can stay empty if the dream fails or is canceled before
          # then. The memory store holds the complete result only once `status` is
          # `completed`.
          #
          # See the
          # [Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#use-the-output)
          # for how to review and use the result.
          outputs:,
          # The ID of the session that runs the dream (`sesn_...`), or `null` if that
          # session hasn't started.
          #
          # Stream that session's events to follow what the dream reads and writes.
          #
          # See the
          # [Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#watch-the-pipeline-run)
          # for how to watch a running dream.
          session_id:,
          # Where a dream is in its lifecycle.
          #
          # `completed`, `failed`, and `canceled` are final: once a dream has one of these
          # statuses, its status doesn't change again.
          #
          # See the
          # [Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#lifecycle)
          # for what each status means.
          status:,
          type:,
          # The dream's token counts, which stop changing once its `status` is `completed`
          # or `failed`. After a cancel, they can keep changing.
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
              output_behavior: Anthropic::Beta::BetaOutputBehavior::Variants,
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
