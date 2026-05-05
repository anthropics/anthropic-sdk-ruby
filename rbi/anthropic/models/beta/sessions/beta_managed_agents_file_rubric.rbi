# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsFileRubric < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsFileRubric,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the rubric file.
          sig { returns(String) }
          attr_accessor :file_id

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsFileRubric::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Rubric referenced by a file uploaded via the Files API.
          sig do
            params(
              file_id: String,
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsFileRubric::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # ID of the rubric file.
            file_id:,
            type:
          )
          end

          sig do
            override.returns(
              {
                file_id: String,
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsFileRubric::Type::TaggedSymbol
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsFileRubric::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            FILE =
              T.let(
                :file,
                Anthropic::Beta::Sessions::BetaManagedAgentsFileRubric::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsFileRubric::Type::TaggedSymbol
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
