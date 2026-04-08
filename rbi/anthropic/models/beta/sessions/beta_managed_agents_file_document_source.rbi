# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsFileDocumentSource < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsFileDocumentSource,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of a previously uploaded file.
          sig { returns(String) }
          attr_accessor :file_id

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsFileDocumentSource::Type::OrSymbol
            )
          end
          attr_accessor :type

          # Document referenced by file ID.
          sig do
            params(
              file_id: String,
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsFileDocumentSource::Type::OrSymbol
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsFileDocumentSource::Type::OrSymbol
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsFileDocumentSource::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            FILE =
              T.let(
                :file,
                Anthropic::Beta::Sessions::BetaManagedAgentsFileDocumentSource::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsFileDocumentSource::Type::TaggedSymbol
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
