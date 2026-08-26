# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::Invites#retrieve
        class InviteRetrieveParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute invite_id
          #   ID of the Invite.
          #
          #   @return [String]
          required :invite_id, String

          # @!method initialize(invite_id:, request_options: {})
          #   @param invite_id [String] ID of the Invite.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
