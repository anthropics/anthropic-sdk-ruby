# typed: strong

module Anthropic
  module Models
    module Beta
      module UserProfiles
        class BetaUserProfileEnrollEndUserAction < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::UserProfiles::BetaUserProfileEnrollEndUserAction,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # The end-user that the profile represents enrolls in a program.
          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(type: :enroll_end_user)
          end

          sig { override.returns({ type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
