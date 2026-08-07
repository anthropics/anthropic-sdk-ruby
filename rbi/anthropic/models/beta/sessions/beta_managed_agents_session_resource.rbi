# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        # A memory store attached to an agent session.
        module BetaManagedAgentsSessionResource
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource,
                Anthropic::Beta::Sessions::BetaManagedAgentsFileResource,
                Anthropic::Beta::Sessions::BetaManagedAgentsMemoryStoreResource
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionResource::Variants
              ]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type: T.any(Symbol, String),
              id: String,
              created_at: Time,
              mount_path: T.any(String, T.nilable(String)),
              updated_at: Time,
              url: String,
              checkout:
                T.nilable(
                  T.any(
                    Anthropic::Beta::BetaManagedAgentsBranchCheckout::OrHash,
                    Anthropic::Beta::BetaManagedAgentsCommitCheckout::OrHash
                  )
                ),
              file_id: String,
              memory_store_id: String,
              access:
                T.nilable(
                  Anthropic::Beta::Sessions::BetaManagedAgentsMemoryStoreResource::Access::OrSymbol
                ),
              description: String,
              instructions: T.nilable(String),
              name: T.nilable(String)
            ).returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionResource::Variants
            )
          end
          def self.new(
            type:,
            id: nil,
            # A timestamp in RFC 3339 format
            created_at: nil,
            # Filesystem path where the store is mounted in the session container, e.g.
            # /mnt/memory/user-preferences. Derived from the store's name. Output-only.
            mount_path: nil,
            # A timestamp in RFC 3339 format
            updated_at: nil,
            url: nil,
            checkout: nil,
            file_id: nil,
            # The memory store ID (memstore\_...). Must belong to the caller's organization
            # and workspace.
            memory_store_id: nil,
            # Access mode for an attached memory store.
            access: nil,
            # Description of the memory store, snapshotted at attach time. Rendered into the
            # agent's system prompt. Empty string when the store has no description.
            description: nil,
            # Per-attachment guidance for the agent on how to use this store. Rendered into
            # the memory section of the system prompt. Max 4096 chars.
            instructions: nil,
            # Display name of the memory store, snapshotted at attach time. Later edits to the
            # store's name do not propagate to this resource.
            name: nil
          )
          end
        end
      end
    end
  end
end
