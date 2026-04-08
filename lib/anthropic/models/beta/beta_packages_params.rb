# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaPackagesParams < Anthropic::Internal::Type::BaseModel
        # @!attribute apt
        #   Ubuntu/Debian packages to install
        #
        #   @return [Array<String>, nil]
        optional :apt, Anthropic::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute cargo
        #   Rust packages to install
        #
        #   @return [Array<String>, nil]
        optional :cargo, Anthropic::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute gem_
        #   Ruby packages to install
        #
        #   @return [Array<String>, nil]
        optional :gem_, Anthropic::Internal::Type::ArrayOf[String], api_name: :gem, nil?: true

        # @!attribute go
        #   Go packages to install
        #
        #   @return [Array<String>, nil]
        optional :go, Anthropic::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute npm
        #   Node.js packages to install
        #
        #   @return [Array<String>, nil]
        optional :npm, Anthropic::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute pip
        #   Python packages to install
        #
        #   @return [Array<String>, nil]
        optional :pip, Anthropic::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute type
        #   Package configuration type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaPackagesParams::Type, nil]
        optional :type, enum: -> { Anthropic::Beta::BetaPackagesParams::Type }

        # @!method initialize(apt: nil, cargo: nil, gem_: nil, go: nil, npm: nil, pip: nil, type: nil)
        #   Specify packages (and optionally their versions) available in this environment.
        #
        #   When versioning, use the version semantics relevant for the package manager,
        #   e.g. for `pip` use `package==1.0.0`. You are responsible for validating the
        #   package and version exist. Unversioned installs the latest.
        #
        #   @param apt [Array<String>, nil] Ubuntu/Debian packages to install
        #
        #   @param cargo [Array<String>, nil] Rust packages to install
        #
        #   @param gem_ [Array<String>, nil] Ruby packages to install
        #
        #   @param go [Array<String>, nil] Go packages to install
        #
        #   @param npm [Array<String>, nil] Node.js packages to install
        #
        #   @param pip [Array<String>, nil] Python packages to install
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaPackagesParams::Type] Package configuration type

        # Package configuration type
        #
        # @see Anthropic::Models::Beta::BetaPackagesParams#type
        module Type
          extend Anthropic::Internal::Type::Enum

          PACKAGES = :packages

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaPackagesParams = Beta::BetaPackagesParams
  end
end
