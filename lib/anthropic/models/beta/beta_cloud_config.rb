# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCloudConfig < Anthropic::Internal::Type::BaseModel
        # @!attribute networking
        #   Network configuration policy.
        #
        #   @return [Anthropic::Models::Beta::BetaUnrestrictedNetwork, Anthropic::Models::Beta::BetaLimitedNetwork]
        required :networking, union: -> { Anthropic::Beta::BetaCloudConfig::Networking }

        # @!attribute packages
        #   Package manager configuration.
        #
        #   @return [Anthropic::Models::Beta::BetaPackages]
        required :packages, -> { Anthropic::Beta::BetaPackages }

        # @!attribute type
        #   Environment type
        #
        #   @return [Symbol, :cloud]
        required :type, const: :cloud

        # @!method initialize(networking:, packages:, type: :cloud)
        #   `cloud` environment configuration.
        #
        #   @param networking [Anthropic::Models::Beta::BetaUnrestrictedNetwork, Anthropic::Models::Beta::BetaLimitedNetwork] Network configuration policy.
        #
        #   @param packages [Anthropic::Models::Beta::BetaPackages] Package manager configuration.
        #
        #   @param type [Symbol, :cloud] Environment type

        # Network configuration policy.
        #
        # @see Anthropic::Models::Beta::BetaCloudConfig#networking
        module Networking
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # Unrestricted network access.
          variant :unrestricted, -> { Anthropic::Beta::BetaUnrestrictedNetwork }

          # Limited network access.
          variant :limited, -> { Anthropic::Beta::BetaLimitedNetwork }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaUnrestrictedNetwork, Anthropic::Models::Beta::BetaLimitedNetwork)]
        end
      end
    end

    BetaCloudConfig = Beta::BetaCloudConfig
  end
end
