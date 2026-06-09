# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsGitHubRepositoryResourceConfig =
      Beta::BetaManagedAgentsGitHubRepositoryResourceConfig

    module Beta
      class BetaManagedAgentsGitHubRepositoryResourceConfig < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceConfig,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceConfig::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # Github URL of the repository
        sig { returns(String) }
        attr_accessor :url

        # Branch or commit to check out. Defaults to the repository's default branch.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceConfig::Checkout::Variants
            )
          )
        end
        attr_accessor :checkout

        # Mount path in the container. Defaults to `/workspace/<repo-name>`.
        sig { returns(T.nilable(String)) }
        attr_accessor :mount_path

        # A GitHub repository mounted into each session's container. The authorization
        # token is write-only and never returned.
        sig do
          params(
            type:
              Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceConfig::Type::OrSymbol,
            url: String,
            checkout:
              T.nilable(
                T.any(
                  Anthropic::Beta::BetaManagedAgentsBranchCheckout::OrHash,
                  Anthropic::Beta::BetaManagedAgentsCommitCheckout::OrHash
                )
              ),
            mount_path: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          type:,
          # Github URL of the repository
          url:,
          # Branch or commit to check out. Defaults to the repository's default branch.
          checkout: nil,
          # Mount path in the container. Defaults to `/workspace/<repo-name>`.
          mount_path: nil
        )
        end

        sig do
          override.returns(
            {
              type:
                Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceConfig::Type::TaggedSymbol,
              url: String,
              checkout:
                T.nilable(
                  Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceConfig::Checkout::Variants
                ),
              mount_path: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceConfig::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          GITHUB_REPOSITORY =
            T.let(
              :github_repository,
              Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceConfig::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceConfig::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Branch or commit to check out. Defaults to the repository's default branch.
        module Checkout
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaManagedAgentsBranchCheckout,
                Anthropic::Beta::BetaManagedAgentsCommitCheckout
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceConfig::Checkout::Variants
              ]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end
