# typed: strong

module Anthropic
  module Models
    BetaPackages = Beta::BetaPackages

    module Beta
      class BetaPackages < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Anthropic::Beta::BetaPackages, Anthropic::Internal::AnyHash)
          end

        # Ubuntu/Debian packages to install
        sig { returns(T::Array[String]) }
        attr_accessor :apt

        # Rust packages to install
        sig { returns(T::Array[String]) }
        attr_accessor :cargo

        # Ruby packages to install
        sig { returns(T::Array[String]) }
        attr_accessor :gem_

        # Go packages to install
        sig { returns(T::Array[String]) }
        attr_accessor :go

        # Node.js packages to install
        sig { returns(T::Array[String]) }
        attr_accessor :npm

        # Python packages to install
        sig { returns(T::Array[String]) }
        attr_accessor :pip

        # Package configuration type
        sig do
          returns(T.nilable(Anthropic::Beta::BetaPackages::Type::TaggedSymbol))
        end
        attr_reader :type

        sig { params(type: Anthropic::Beta::BetaPackages::Type::OrSymbol).void }
        attr_writer :type

        # Packages (and their versions) available in this environment.
        sig do
          params(
            apt: T::Array[String],
            cargo: T::Array[String],
            gem_: T::Array[String],
            go: T::Array[String],
            npm: T::Array[String],
            pip: T::Array[String],
            type: Anthropic::Beta::BetaPackages::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Ubuntu/Debian packages to install
          apt:,
          # Rust packages to install
          cargo:,
          # Ruby packages to install
          gem_:,
          # Go packages to install
          go:,
          # Node.js packages to install
          npm:,
          # Python packages to install
          pip:,
          # Package configuration type
          type: nil
        )
        end

        sig do
          override.returns(
            {
              apt: T::Array[String],
              cargo: T::Array[String],
              gem_: T::Array[String],
              go: T::Array[String],
              npm: T::Array[String],
              pip: T::Array[String],
              type: Anthropic::Beta::BetaPackages::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # Package configuration type
        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Anthropic::Beta::BetaPackages::Type) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PACKAGES =
            T.let(:packages, Anthropic::Beta::BetaPackages::Type::TaggedSymbol)

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaPackages::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
