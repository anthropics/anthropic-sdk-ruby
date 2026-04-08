# typed: strong

module Anthropic
  module Models
    BetaPackagesParams = Beta::BetaPackagesParams

    module Beta
      class BetaPackagesParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaPackagesParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Ubuntu/Debian packages to install
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :apt

        # Rust packages to install
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :cargo

        # Ruby packages to install
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :gem_

        # Go packages to install
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :go

        # Node.js packages to install
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :npm

        # Python packages to install
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :pip

        # Package configuration type
        sig do
          returns(
            T.nilable(Anthropic::Beta::BetaPackagesParams::Type::OrSymbol)
          )
        end
        attr_reader :type

        sig do
          params(type: Anthropic::Beta::BetaPackagesParams::Type::OrSymbol).void
        end
        attr_writer :type

        # Specify packages (and optionally their versions) available in this environment.
        #
        # When versioning, use the version semantics relevant for the package manager,
        # e.g. for `pip` use `package==1.0.0`. You are responsible for validating the
        # package and version exist. Unversioned installs the latest.
        sig do
          params(
            apt: T.nilable(T::Array[String]),
            cargo: T.nilable(T::Array[String]),
            gem_: T.nilable(T::Array[String]),
            go: T.nilable(T::Array[String]),
            npm: T.nilable(T::Array[String]),
            pip: T.nilable(T::Array[String]),
            type: Anthropic::Beta::BetaPackagesParams::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Ubuntu/Debian packages to install
          apt: nil,
          # Rust packages to install
          cargo: nil,
          # Ruby packages to install
          gem_: nil,
          # Go packages to install
          go: nil,
          # Node.js packages to install
          npm: nil,
          # Python packages to install
          pip: nil,
          # Package configuration type
          type: nil
        )
        end

        sig do
          override.returns(
            {
              apt: T.nilable(T::Array[String]),
              cargo: T.nilable(T::Array[String]),
              gem_: T.nilable(T::Array[String]),
              go: T.nilable(T::Array[String]),
              npm: T.nilable(T::Array[String]),
              pip: T.nilable(T::Array[String]),
              type: Anthropic::Beta::BetaPackagesParams::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        # Package configuration type
        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaPackagesParams::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PACKAGES =
            T.let(
              :packages,
              Anthropic::Beta::BetaPackagesParams::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaPackagesParams::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
