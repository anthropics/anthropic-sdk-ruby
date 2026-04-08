# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsGitHubRepositoryResource < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          # A timestamp in RFC 3339 format
          sig { returns(Time) }
          attr_accessor :created_at

          sig { returns(String) }
          attr_accessor :mount_path

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # A timestamp in RFC 3339 format
          sig { returns(Time) }
          attr_accessor :updated_at

          sig { returns(String) }
          attr_accessor :url

          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource::Checkout::Variants
              )
            )
          end
          attr_accessor :checkout

          sig do
            params(
              id: String,
              created_at: Time,
              mount_path: String,
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource::Type::OrSymbol,
              updated_at: Time,
              url: String,
              checkout:
                T.nilable(
                  T.any(
                    Anthropic::Beta::BetaManagedAgentsBranchCheckout::OrHash,
                    Anthropic::Beta::BetaManagedAgentsCommitCheckout::OrHash
                  )
                )
            ).returns(T.attached_class)
          end
          def self.new(
            id:,
            # A timestamp in RFC 3339 format
            created_at:,
            mount_path:,
            type:,
            # A timestamp in RFC 3339 format
            updated_at:,
            url:,
            checkout: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                created_at: Time,
                mount_path: String,
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource::Type::TaggedSymbol,
                updated_at: Time,
                url: String,
                checkout:
                  T.nilable(
                    Anthropic::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource::Checkout::Variants
                  )
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            GITHUB_REPOSITORY =
              T.let(
                :github_repository,
                Anthropic::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

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
                  Anthropic::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource::Checkout::Variants
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
end
