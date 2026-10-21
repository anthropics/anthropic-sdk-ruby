# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsSessionActor < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::MemoryStores::BetaManagedAgentsSessionActor,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the session (a `sesn_...` value). Look up the session via
          # [Retrieve a session](/en/api/beta/sessions/retrieve) for further provenance.
          sig { returns(String) }
          attr_accessor :session_id

          sig { returns(Symbol) }
          attr_accessor :type

          # An agent acting during a session, for example through the session's mounted
          # filesystem. It names the session itself, not the user or API key that started
          # the session.
          sig do
            params(session_id: String, type: Symbol).returns(T.attached_class)
          end
          def self.new(
            # ID of the session (a `sesn_...` value). Look up the session via
            # [Retrieve a session](/en/api/beta/sessions/retrieve) for further provenance.
            session_id:,
            type: :session_actor
          )
          end

          sig { override.returns({ session_id: String, type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
