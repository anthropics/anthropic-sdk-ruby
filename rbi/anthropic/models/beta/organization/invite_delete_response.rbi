# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class InviteDeleteResponse < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Models::Beta::Organization::InviteDeleteResponse,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the Invite.
          sig { returns(String) }
          attr_accessor :id

          # Deleted object type.
          #
          # For Invites, this is always `"invite_deleted"`.
          sig { returns(Symbol) }
          attr_accessor :type

          sig { params(id: String, type: Symbol).returns(T.attached_class) }
          def self.new(
            # ID of the Invite.
            id:,
            # Deleted object type.
            #
            # For Invites, this is always `"invite_deleted"`.
            type: :invite_deleted
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
