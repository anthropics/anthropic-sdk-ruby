# typed: strong

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            class BetaGoogleManagedStorageDisabledParams < Anthropic::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageDisabledParams,
                    Anthropic::Internal::AnyHash
                  )
                end

              sig { returns(Symbol) }
              attr_accessor :type

              # Turns the control off and removes every region's bucket.
              sig { params(type: Symbol).returns(T.attached_class) }
              def self.new(type: :disabled)
              end

              sig { override.returns({ type: Symbol }) }
              def to_hash
              end
            end
          end
        end
      end
    end
  end
end
