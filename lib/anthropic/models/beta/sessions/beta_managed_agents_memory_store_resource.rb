# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsMemoryStoreResource < Anthropic::Internal::Type::BaseModel
          # @!attribute memory_store_id
          #   The memory store ID (memstore\_...). Must belong to the caller's organization
          #   and workspace.
          #
          #   @return [String]
          required :memory_store_id, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMemoryStoreResource::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsMemoryStoreResource::Type }

          # @!attribute access
          #   Access mode for an attached memory store.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMemoryStoreResource::Access, nil]
          optional :access,
                   enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsMemoryStoreResource::Access },
                   nil?: true

          # @!attribute description
          #   Description of the memory store, snapshotted at attach time. Rendered into the
          #   agent's system prompt. Empty string when the store has no description.
          #
          #   @return [String, nil]
          optional :description, String

          # @!attribute instructions
          #   Per-attachment guidance for the agent on how to use this store. Rendered into
          #   the memory section of the system prompt. Max 4096 chars.
          #
          #   @return [String, nil]
          optional :instructions, String, nil?: true

          # @!attribute mount_path
          #   Filesystem path where the store is mounted in the session container, e.g.
          #   /mnt/memory/user-preferences. Derived from the store's name. Output-only.
          #
          #   @return [String, nil]
          optional :mount_path, String, nil?: true

          # @!attribute name
          #   Display name of the memory store, snapshotted at attach time. Later edits to the
          #   store's name do not propagate to this resource.
          #
          #   @return [String, nil]
          optional :name, String, nil?: true

          # @!method initialize(memory_store_id:, type:, access: nil, description: nil, instructions: nil, mount_path: nil, name: nil)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsMemoryStoreResource} for
          #   more details.
          #
          #   A memory store attached to an agent session.
          #
          #   @param memory_store_id [String] The memory store ID (memstore\_...). Must belong to the caller's organization
          #   and
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMemoryStoreResource::Type]
          #
          #   @param access [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMemoryStoreResource::Access, nil] Access mode for an attached memory store.
          #
          #   @param description [String] Description of the memory store, snapshotted at attach time. Rendered into the a
          #
          #   @param instructions [String, nil] Per-attachment guidance for the agent on how to use this store. Rendered into th
          #
          #   @param mount_path [String, nil] Filesystem path where the store is mounted in the session container, e.g. /mnt/m
          #
          #   @param name [String, nil] Display name of the memory store, snapshotted at attach time. Later edits to the

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsMemoryStoreResource#type
          module Type
            extend Anthropic::Internal::Type::Enum

            MEMORY_STORE = :memory_store

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # Access mode for an attached memory store.
          #
          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsMemoryStoreResource#access
          module Access
            extend Anthropic::Internal::Type::Enum

            READ_WRITE = :read_write
            READ_ONLY = :read_only

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
