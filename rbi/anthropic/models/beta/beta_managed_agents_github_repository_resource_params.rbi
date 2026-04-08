# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsGitHubRepositoryResourceParams =
      Beta::BetaManagedAgentsGitHubRepositoryResourceParams

    module Beta
      class BetaManagedAgentsGitHubRepositoryResourceParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceParams,
              Anthropic::Internal::AnyHash
            )
          end

        # GitHub authorization token used to clone the repository.
        sig { returns(String) }
        attr_accessor :authorization_token

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceParams::Type::OrSymbol
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
              T.any(
                Anthropic::Beta::BetaManagedAgentsBranchCheckout,
                Anthropic::Beta::BetaManagedAgentsCommitCheckout
              )
            )
          )
        end
        attr_accessor :checkout

        # Mount path in the container. Defaults to `/workspace/<repo-name>`.
        sig { returns(T.nilable(String)) }
        attr_accessor :mount_path

        # Mount a GitHub repository into the session's container.
        sig do
          params(
            authorization_token: String,
            type:
              Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceParams::Type::OrSymbol,
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
          # GitHub authorization token used to clone the repository.
          authorization_token:,
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
              authorization_token: String,
              type:
                Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceParams::Type::OrSymbol,
              url: String,
              checkout:
                T.nilable(
                  T.any(
                    Anthropic::Beta::BetaManagedAgentsBranchCheckout,
                    Anthropic::Beta::BetaManagedAgentsCommitCheckout
                  )
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
                Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceParams::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          GITHUB_REPOSITORY =
            T.let(
              :github_repository,
              Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceParams::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceParams::Type::TaggedSymbol
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
                Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceParams::Checkout::Variants
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
