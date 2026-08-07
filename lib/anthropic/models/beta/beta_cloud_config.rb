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

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::BetaCloudConfig::Networking} for more details.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [Boolean] :allow_mcp_servers Permits outbound access to MCP server endpoints configured on the agent, beyond
          #
          #   @option args [Boolean] :allow_package_managers Permits outbound access to public package registries (PyPI, npm, etc.) beyond th
          #
          #   @option args [Array<String>] :allowed_hosts Specifies domains the container can reach.
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::BetaUnrestrictedNetwork, Anthropic::Models::Beta::BetaLimitedNetwork]
          def self.new(type:, **args)
            case type.to_sym
            when :unrestricted
              Anthropic::Beta::BetaUnrestrictedNetwork.new(**args)
            when :limited
              Anthropic::Beta::BetaLimitedNetwork.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end

    BetaCloudConfig = Beta::BetaCloudConfig
  end
end
