# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsSessionResourceConfig =
      Beta::BetaManagedAgentsSessionResourceConfig

    module Beta
      # A configured session resource. Echoes the input minus write-only credentials.
      module BetaManagedAgentsSessionResourceConfig
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceConfig,
              Anthropic::Beta::BetaManagedAgentsFileResourceConfig,
              Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceConfig
            )
          end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsSessionResourceConfig::Variants
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
            url: String,
            checkout:
              T.nilable(
                T.any(
                  Anthropic::Beta::BetaManagedAgentsBranchCheckout::OrHash,
                  Anthropic::Beta::BetaManagedAgentsCommitCheckout::OrHash
                )
              ),
            mount_path: T.nilable(String),
            file_id: String,
            memory_store_id: String,
            access:
              T.nilable(
                Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceConfig::Access::OrSymbol
              ),
            instructions: T.nilable(String)
          ).returns(
            Anthropic::Beta::BetaManagedAgentsSessionResourceConfig::Variants
          )
        end
        def self.new(
          type:,
          # Github URL of the repository
          url: nil,
          # Branch or commit to check out. Defaults to the repository's default branch.
          checkout: nil,
          # Mount path in the container. Defaults to `/workspace/<repo-name>`.
          mount_path: nil,
          # ID of a previously uploaded file.
          file_id: nil,
          # The memory store ID (memstore\_...). Must belong to the caller's organization
          # and workspace.
          memory_store_id: nil,
          # Access mode for an attached memory store.
          access: nil,
          # Per-attachment guidance for the agent on how to use this store. Rendered into
          # the memory section of the system prompt. Max 4096 chars.
          instructions: nil
        )
        end
      end
    end
  end
end
