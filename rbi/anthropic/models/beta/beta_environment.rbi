# typed: strong

module Anthropic
  module Models
    BetaEnvironment = Beta::BetaEnvironment

    module Beta
      class BetaEnvironment < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaEnvironment,
              Anthropic::Internal::AnyHash
            )
          end

        # Environment identifier (e.g., 'env\_...')
        sig { returns(String) }
        attr_accessor :id

        # RFC 3339 timestamp when environment was archived, or null if not archived
        sig { returns(T.nilable(String)) }
        attr_accessor :archived_at

        # Environment configuration (either Anthropic Cloud or self-hosted)
        sig { returns(Anthropic::Beta::BetaEnvironment::Config::Variants) }
        attr_accessor :config

        # RFC 3339 timestamp when environment was created
        sig { returns(String) }
        attr_accessor :created_at

        # User-provided description for the environment
        sig { returns(String) }
        attr_accessor :description

        # User-provided metadata key-value pairs
        sig { returns(T::Hash[Symbol, String]) }
        attr_accessor :metadata

        # Human-readable name for the environment
        sig { returns(String) }
        attr_accessor :name

        # The type of object (always 'environment')
        sig { returns(Symbol) }
        attr_accessor :type

        # RFC 3339 timestamp when environment was last updated
        sig { returns(String) }
        attr_accessor :updated_at

        # The visibility scope for this environment. 'organization' means visible to all
        # accounts. 'account' means visible only to the owning account.
        sig do
          returns(
            T.nilable(Anthropic::Beta::BetaEnvironment::Scope::TaggedSymbol)
          )
        end
        attr_reader :scope

        sig do
          params(scope: Anthropic::Beta::BetaEnvironment::Scope::OrSymbol).void
        end
        attr_writer :scope

        # Unified Environment resource for both cloud and self-hosted environments.
        sig do
          params(
            id: String,
            archived_at: T.nilable(String),
            config:
              T.any(
                Anthropic::Beta::BetaCloudConfig::OrHash,
                Anthropic::Beta::BetaSelfHostedConfig::OrHash
              ),
            created_at: String,
            description: String,
            metadata: T::Hash[Symbol, String],
            name: String,
            updated_at: String,
            scope: Anthropic::Beta::BetaEnvironment::Scope::OrSymbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Environment identifier (e.g., 'env\_...')
          id:,
          # RFC 3339 timestamp when environment was archived, or null if not archived
          archived_at:,
          # Environment configuration (either Anthropic Cloud or self-hosted)
          config:,
          # RFC 3339 timestamp when environment was created
          created_at:,
          # User-provided description for the environment
          description:,
          # User-provided metadata key-value pairs
          metadata:,
          # Human-readable name for the environment
          name:,
          # RFC 3339 timestamp when environment was last updated
          updated_at:,
          # The visibility scope for this environment. 'organization' means visible to all
          # accounts. 'account' means visible only to the owning account.
          scope: nil,
          # The type of object (always 'environment')
          type: :environment
        )
        end

        sig do
          override.returns(
            {
              id: String,
              archived_at: T.nilable(String),
              config: Anthropic::Beta::BetaEnvironment::Config::Variants,
              created_at: String,
              description: String,
              metadata: T::Hash[Symbol, String],
              name: String,
              type: Symbol,
              updated_at: String,
              scope: Anthropic::Beta::BetaEnvironment::Scope::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # Environment configuration (either Anthropic Cloud or self-hosted)
        module Config
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaCloudConfig,
                Anthropic::Beta::BetaSelfHostedConfig
              )
            end

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaEnvironment::Config::Variants]
            )
          end
          def self.variants
          end
        end

        # The visibility scope for this environment. 'organization' means visible to all
        # accounts. 'account' means visible only to the owning account.
        module Scope
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaEnvironment::Scope)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ORGANIZATION =
            T.let(
              :organization,
              Anthropic::Beta::BetaEnvironment::Scope::TaggedSymbol
            )
          ACCOUNT =
            T.let(
              :account,
              Anthropic::Beta::BetaEnvironment::Scope::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaEnvironment::Scope::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
