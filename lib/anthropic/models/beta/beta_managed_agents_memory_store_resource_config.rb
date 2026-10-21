# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsMemoryStoreResourceConfig < Anthropic::Internal::Type::BaseModel
        # @!attribute memory_store_id
        #   The memory store ID (memstore\_...). Must belong to the caller's organization
        #   and workspace.
        #
        #   @return [String]
        required :memory_store_id, String

        # @!attribute type
        #
        #   @return [Symbol, :memory_store]
        required :type, const: :memory_store

        # @!attribute access
        #   Access mode for the mounted store. Defaults to `read_write`. `read_only` mounts
        #   the store as a read-only filesystem.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreResourceConfig::Access, nil]
        optional :access,
                 enum: -> { Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceConfig::Access },
                 nil?: true

        # @!attribute instructions
        #   Per-attachment guidance for the agent on how to use this store. Rendered into
        #   the memory section of the system prompt. Max 4096 chars.
        #
        #   @return [String, nil]
        optional :instructions, String, nil?: true

        # @!method initialize(memory_store_id:, access: nil, instructions: nil, type: :memory_store)
        #   A memory store attached to each session created from this deployment.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreResourceConfig} for more
        #   details.
        #
        #   @param memory_store_id [String] The memory store ID (memstore\_...). Must belong to the caller's organization
        #   and
        #
        #   @param access [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreResourceConfig::Access, nil] Access mode for the mounted store. Defaults to `read_write`. `read_only` mounts
        #
        #   @param instructions [String, nil] Per-attachment guidance for the agent on how to use this store. Rendered into th
        #
        #   @param type [Symbol, :memory_store]

        # Access mode for the mounted store. Defaults to `read_write`. `read_only` mounts
        # the store as a read-only filesystem.
        #
        # @see Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreResourceConfig#access
        module Access
          extend Anthropic::Internal::Type::Enum

          READ_WRITE = :read_write
          READ_ONLY = :read_only

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsMemoryStoreResourceConfig = Beta::BetaManagedAgentsMemoryStoreResourceConfig
  end
end
