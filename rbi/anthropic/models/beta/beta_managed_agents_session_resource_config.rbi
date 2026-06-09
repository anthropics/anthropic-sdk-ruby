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
      end
    end
  end
end
