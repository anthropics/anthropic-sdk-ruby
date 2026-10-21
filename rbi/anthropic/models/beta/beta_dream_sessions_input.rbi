# typed: strong

module Anthropic
  module Models
    BetaDreamSessionsInput = Beta::BetaDreamSessionsInput

    module Beta
      class BetaDreamSessionsInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaDreamSessionsInput,
              Anthropic::Internal::AnyHash
            )
          end

        # The IDs of the sessions whose transcripts the dream reads (`sesn_...`).
        #
        # Give 1 to 100 IDs, with no duplicates. Each session must be in the same
        # workspace as the dream. Responses list the IDs in sorted order.
        #
        # The
        # [limits table in the Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#limits)
        # lists all the limits on a dream.
        sig { returns(T::Array[String]) }
        attr_accessor :session_ids

        sig { returns(Symbol) }
        attr_accessor :type

        # The sessions that a dream reads, given as an entry in `inputs`.
        sig do
          params(session_ids: T::Array[String], type: Symbol).returns(
            T.attached_class
          )
        end
        def self.new(
          # The IDs of the sessions whose transcripts the dream reads (`sesn_...`).
          #
          # Give 1 to 100 IDs, with no duplicates. Each session must be in the same
          # workspace as the dream. Responses list the IDs in sorted order.
          #
          # The
          # [limits table in the Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#limits)
          # lists all the limits on a dream.
          session_ids:,
          type: :sessions
        )
        end

        sig do
          override.returns({ session_ids: T::Array[String], type: Symbol })
        end
        def to_hash
        end
      end
    end
  end
end
