# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsMemoryStoreResourceParam < Anthropic::Internal::Type::BaseModel
        # @!attribute memory_store_id
        #   The memory store ID (memstore\_...). Must belong to the caller's organization
        #   and workspace.
        #
        #   @return [String]
        required :memory_store_id, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreResourceParam::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceParam::Type }

        # @!attribute access
        #   Access mode for an attached memory store.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreResourceParam::Access, nil]
        optional :access,
                 enum: -> { Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceParam::Access },
                 nil?: true

        # @!attribute instructions
        #   Per-attachment guidance for the agent on how to use this store. Rendered into
        #   the memory section of the system prompt. Max 4096 chars.
        #
        #   @return [String, nil]
        optional :instructions, String, nil?: true

        # @!method initialize(memory_store_id:, type:, access: nil, instructions: nil)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreResourceParam} for more
        #   details.
        #
        #   Parameters for attaching a memory store to an agent session.
        #
        #   @param memory_store_id [String] The memory store ID (memstore\_...). Must belong to the caller's organization
        #   and
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreResourceParam::Type]
        #
        #   @param access [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreResourceParam::Access, nil] Access mode for an attached memory store.
        #
        #   @param instructions [String, nil] Per-attachment guidance for the agent on how to use this store. Rendered into th

        # @see Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreResourceParam#type
        module Type
          extend Anthropic::Internal::Type::Enum

          MEMORY_STORE = :memory_store

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Access mode for an attached memory store.
        #
        # @see Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreResourceParam#access
        module Access
          extend Anthropic::Internal::Type::Enum

          READ_WRITE = :read_write
          READ_ONLY = :read_only

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsMemoryStoreResourceParam = Beta::BetaManagedAgentsMemoryStoreResourceParam
  end
end
