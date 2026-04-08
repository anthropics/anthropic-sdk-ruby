# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCloudConfigParams < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #   Environment type
        #
        #   @return [Symbol, :cloud]
        required :type, const: :cloud

        # @!attribute networking
        #   Network configuration policy. Omit on update to preserve the existing value.
        #
        #   @return [Anthropic::Models::Beta::BetaUnrestrictedNetwork, Anthropic::Models::Beta::BetaLimitedNetworkParams, nil]
        optional :networking, union: -> { Anthropic::Beta::BetaCloudConfigParams::Networking }, nil?: true

        # @!attribute packages
        #   Specify packages (and optionally their versions) available in this environment.
        #
        #   When versioning, use the version semantics relevant for the package manager,
        #   e.g. for `pip` use `package==1.0.0`. You are responsible for validating the
        #   package and version exist. Unversioned installs the latest.
        #
        #   @return [Anthropic::Models::Beta::BetaPackagesParams, nil]
        optional :packages, -> { Anthropic::Beta::BetaPackagesParams }, nil?: true

        # @!method initialize(networking: nil, packages: nil, type: :cloud)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaCloudConfigParams} for more details.
        #
        #   Request params for `cloud` environment configuration.
        #
        #   Fields default to null; on update, omitted fields preserve the existing value.
        #
        #   @param networking [Anthropic::Models::Beta::BetaUnrestrictedNetwork, Anthropic::Models::Beta::BetaLimitedNetworkParams, nil] Network configuration policy. Omit on update to preserve the existing value.
        #
        #   @param packages [Anthropic::Models::Beta::BetaPackagesParams, nil] Specify packages (and optionally their versions) available in this environment.
        #
        #   @param type [Symbol, :cloud] Environment type

        # Network configuration policy. Omit on update to preserve the existing value.
        #
        # @see Anthropic::Models::Beta::BetaCloudConfigParams#networking
        module Networking
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # Unrestricted network access.
          variant :unrestricted, -> { Anthropic::Beta::BetaUnrestrictedNetwork }

          # Limited network request params.
          #
          # Fields default to null; on update, omitted fields preserve the
          # existing value.
          variant :limited, -> { Anthropic::Beta::BetaLimitedNetworkParams }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaUnrestrictedNetwork, Anthropic::Models::Beta::BetaLimitedNetworkParams)]
        end
      end
    end

    BetaCloudConfigParams = Beta::BetaCloudConfigParams
  end
end
