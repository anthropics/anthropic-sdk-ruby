# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              class BetaGoogleManagedProjectCMEKDisabledParams < Anthropic::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKDisabledParams,
                      Anthropic::Internal::AnyHash
                    )
                  end

                sig { returns(Symbol) }
                attr_accessor :type

                # Turns the control off and removes every region's key.
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
end
