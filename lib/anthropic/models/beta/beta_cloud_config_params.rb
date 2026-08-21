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
        #   Request params for `cloud` environment configuration.
        #
        #   Fields default to null; on update, omitted fields preserve the existing value.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaCloudConfigParams} for more details.
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

          module Type
            extend Anthropic::Internal::Type::Enum

            UNRESTRICTED = :unrestricted
            LIMITED = :limited

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaUnrestrictedNetwork, Anthropic::Models::Beta::BetaLimitedNetworkParams)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::BetaCloudConfigParams::Networking} for more details.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [Boolean, nil] :allow_mcp_servers Permits outbound access to MCP server endpoints configured on the agent, beyond
          #
          #   @option args [Boolean, nil] :allow_package_managers Permits outbound access to public package registries (PyPI, npm, etc.) beyond th
          #
          #   @option args [Array<String>, nil] :allowed_hosts Specifies domains the container can reach.
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::BetaUnrestrictedNetwork, Anthropic::Models::Beta::BetaLimitedNetworkParams]
          def self.new(type:, **args)
            case type.to_sym
            when :unrestricted
              Anthropic::Beta::BetaUnrestrictedNetwork.new(**args)
            when :limited
              Anthropic::Beta::BetaLimitedNetworkParams.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end

    BetaCloudConfigParams = Beta::BetaCloudConfigParams
  end
end
