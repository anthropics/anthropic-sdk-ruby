# typed: strong

module Anthropic
  module Models
    BetaDreamInput = Beta::BetaDreamInput

    module Beta
      # A source that a dream reads, such as a memory store or a set of sessions.
      module BetaDreamInput
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaDreamMemoryStoreInput,
              Anthropic::Beta::BetaDreamSessionsInput
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaDreamInput::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MEMORY_STORE =
            T.let(
              :memory_store,
              Anthropic::Beta::BetaDreamInput::Type::TaggedSymbol
            )
          SESSIONS =
            T.let(
              :sessions,
              Anthropic::Beta::BetaDreamInput::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaDreamInput::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(T::Array[Anthropic::Beta::BetaDreamInput::Variants])
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type: Anthropic::Beta::BetaDreamInput::Type::OrSymbol,
            memory_store_id: String,
            session_ids: T::Array[String]
          ).returns(Anthropic::Beta::BetaDreamInput::Variants)
        end
        def self.new(
          type:,
          # The ID of the memory store for the dream to read (`memstore_...`).
          #
          # The memory store must be in the same workspace as the dream and must not be
          # archived.
          memory_store_id: nil,
          # The IDs of the sessions whose transcripts the dream reads (`sesn_...`).
          #
          # Give 1 to 100 IDs, with no duplicates. Each session must be in the same
          # workspace as the dream. Responses list the IDs in sorted order.
          session_ids: nil
        )
        end
      end
    end
  end
end
