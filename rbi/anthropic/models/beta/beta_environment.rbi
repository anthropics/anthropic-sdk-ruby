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

        # `cloud` environment configuration.
        sig { returns(Anthropic::Beta::BetaCloudConfig) }
        attr_reader :config

        sig { params(config: Anthropic::Beta::BetaCloudConfig::OrHash).void }
        attr_writer :config

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

        # Unified Environment resource for both cloud and self-hosted environments.
        sig do
          params(
            id: String,
            archived_at: T.nilable(String),
            config: Anthropic::Beta::BetaCloudConfig::OrHash,
            created_at: String,
            description: String,
            metadata: T::Hash[Symbol, String],
            name: String,
            updated_at: String,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Environment identifier (e.g., 'env\_...')
          id:,
          # RFC 3339 timestamp when environment was archived, or null if not archived
          archived_at:,
          # `cloud` environment configuration.
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
          # The type of object (always 'environment')
          type: :environment
        )
        end

        sig do
          override.returns(
            {
              id: String,
              archived_at: T.nilable(String),
              config: Anthropic::Beta::BetaCloudConfig,
              created_at: String,
              description: String,
              metadata: T::Hash[Symbol, String],
              name: String,
              type: Symbol,
              updated_at: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
