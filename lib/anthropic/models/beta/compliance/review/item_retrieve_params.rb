# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          # @see Anthropic::Resources::Beta::Compliance::Review::Items#retrieve
          class ItemRetrieveParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute item_id
            #   The ID of the item. For a message, its ID as the client received it or as a
            #   review case lists it, such as `msg_...`.
            #
            #   @return [String]
            required :item_id, String

            # @!attribute betas
            #   Optional header to specify the beta version(s) you want to use.
            #
            #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
            optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

            # @!attribute user_profile_id
            #   The ID of the user profile that the message was recorded with (`uprof_...`).
            #   Send it for a message recorded with a user profile, and leave it out for a
            #   message recorded with none.
            #
            #   @return [String, nil]
            optional :user_profile_id, String

            # @!method initialize(item_id:, betas: nil, user_profile_id: nil, request_options: {})
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Compliance::Review::ItemRetrieveParams} for more
            #   details.
            #
            #   @param item_id [String] The ID of the item. For a message, its ID as the client received it or as a revi
            #
            #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
            #
            #   @param user_profile_id [String] The ID of the user profile that the message was recorded with (`uprof_...`). Sen
            #
            #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
          end
        end
      end
    end
  end
end
