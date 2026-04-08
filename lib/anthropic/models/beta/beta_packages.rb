# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaPackages < Anthropic::Internal::Type::BaseModel
        # @!attribute apt
        #   Ubuntu/Debian packages to install
        #
        #   @return [Array<String>]
        required :apt, Anthropic::Internal::Type::ArrayOf[String]

        # @!attribute cargo
        #   Rust packages to install
        #
        #   @return [Array<String>]
        required :cargo, Anthropic::Internal::Type::ArrayOf[String]

        # @!attribute gem_
        #   Ruby packages to install
        #
        #   @return [Array<String>]
        required :gem_, Anthropic::Internal::Type::ArrayOf[String], api_name: :gem

        # @!attribute go
        #   Go packages to install
        #
        #   @return [Array<String>]
        required :go, Anthropic::Internal::Type::ArrayOf[String]

        # @!attribute npm
        #   Node.js packages to install
        #
        #   @return [Array<String>]
        required :npm, Anthropic::Internal::Type::ArrayOf[String]

        # @!attribute pip
        #   Python packages to install
        #
        #   @return [Array<String>]
        required :pip, Anthropic::Internal::Type::ArrayOf[String]

        # @!attribute type
        #   Package configuration type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaPackages::Type, nil]
        optional :type, enum: -> { Anthropic::Beta::BetaPackages::Type }

        # @!method initialize(apt:, cargo:, gem_:, go:, npm:, pip:, type: nil)
        #   Packages (and their versions) available in this environment.
        #
        #   @param apt [Array<String>] Ubuntu/Debian packages to install
        #
        #   @param cargo [Array<String>] Rust packages to install
        #
        #   @param gem_ [Array<String>] Ruby packages to install
        #
        #   @param go [Array<String>] Go packages to install
        #
        #   @param npm [Array<String>] Node.js packages to install
        #
        #   @param pip [Array<String>] Python packages to install
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaPackages::Type] Package configuration type

        # Package configuration type
        #
        # @see Anthropic::Models::Beta::BetaPackages#type
        module Type
          extend Anthropic::Internal::Type::Enum

          PACKAGES = :packages

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaPackages = Beta::BetaPackages
  end
end
