# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsFileRubricParams < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsFileRubricParams,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the rubric file.
          sig { returns(String) }
          attr_accessor :file_id

          sig { returns(Symbol) }
          attr_accessor :type

          # Rubric referenced by a file uploaded via the Files API.
          sig do
            params(file_id: String, type: Symbol).returns(T.attached_class)
          end
          def self.new(
            # ID of the rubric file.
            file_id:,
            type: :file
          )
          end

          sig { override.returns({ file_id: String, type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
