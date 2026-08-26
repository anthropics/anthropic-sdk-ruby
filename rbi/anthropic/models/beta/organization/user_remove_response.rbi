# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class UserRemoveResponse < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Models::Beta::Organization::UserRemoveResponse,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the User.
          sig { returns(String) }
          attr_accessor :id

          # Deleted object type.
          #
          # For Users, this is always `"user_deleted"`.
          sig { returns(Symbol) }
          attr_accessor :type

          sig { params(id: String, type: Symbol).returns(T.attached_class) }
          def self.new(
            # ID of the User.
            id:,
            # Deleted object type.
            #
            # For Users, this is always `"user_deleted"`.
            type: :user_deleted
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
