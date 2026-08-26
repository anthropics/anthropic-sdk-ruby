# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class InviteRetrieveParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::InviteRetrieveParams,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the Invite.
          sig { returns(String) }
          attr_accessor :invite_id

          sig do
            params(
              invite_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # ID of the Invite.
            invite_id:,
            request_options: {}
          )
          end

          sig do
            override.returns(
              { invite_id: String, request_options: Anthropic::RequestOptions }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
