# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsFileImageSource < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsFileImageSource,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of a previously uploaded file.
          sig { returns(String) }
          attr_accessor :file_id

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsFileImageSource::Type::OrSymbol
            )
          end
          attr_accessor :type

          # Image referenced by file ID.
          sig do
            params(
              file_id: String,
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsFileImageSource::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # ID of a previously uploaded file.
            file_id:,
            type:
          )
          end

          sig do
            override.returns(
              {
                file_id: String,
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsFileImageSource::Type::OrSymbol
              }
            )
          end
          def to_hash
          end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Sessions::BetaManagedAgentsFileImageSource::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            FILE =
              T.let(
                :file,
                Anthropic::Beta::Sessions::BetaManagedAgentsFileImageSource::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsFileImageSource::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
