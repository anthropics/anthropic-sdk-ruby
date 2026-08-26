# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class ExternalKeyDeleteResponse < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Models::Beta::Organization::ExternalKeyDeleteResponse,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the deleted External Key.
          sig { returns(String) }
          attr_accessor :id

          sig { returns(Symbol) }
          attr_accessor :type

          sig { params(id: String, type: Symbol).returns(T.attached_class) }
          def self.new(
            # ID of the deleted External Key.
            id:,
            type: :external_key_deleted
          )
          end

          sig { override.returns({ id: String, type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
