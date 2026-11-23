# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaStorageMember
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaInternalStorage,
                Anthropic::Beta::Organization::BetaExternalStorageMember
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaStorageMember::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            INTERNAL =
              T.let(
                :internal,
                Anthropic::Beta::Organization::BetaStorageMember::Type::TaggedSymbol
              )
            EXTERNAL =
              T.let(
                :external,
                Anthropic::Beta::Organization::BetaStorageMember::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaStorageMember::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaStorageMember::Variants
              ]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type:
                Anthropic::Beta::Organization::BetaStorageMember::Type::OrSymbol,
              external_storage_id: String
            ).returns(
              Anthropic::Beta::Organization::BetaStorageMember::Variants
            )
          end
          def self.new(
            type:,
            # The External Storage ID, which starts with `estrg_`. Through Claude Platform on
            # AWS, storage whose `provider_config.type` is `aws` has its bucket ARN as its ID
            # instead: `arn:<partition>:s3:::<bucket_name>`, where `<partition>` is the
            # partition of the bucket's region.
            external_storage_id: nil
          )
          end
        end
      end
    end
  end
end
