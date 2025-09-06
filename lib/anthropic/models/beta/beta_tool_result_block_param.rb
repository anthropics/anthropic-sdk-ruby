# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolResultBlockParam < Anthropic::Internal::Type::BaseModel
        # @!attribute tool_use_id
        #
        #   @return [String]
        required :tool_use_id, String

        # @!attribute type
        #
        #   @return [Symbol, :tool_result]
        required :type, const: :tool_result

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!attribute content
        #
        #   @return [String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaSearchResultBlockParam, Anthropic::Models::Beta::BetaRequestDocumentBlock>, nil]
        optional :content, union: -> { Anthropic::Beta::BetaToolResultBlockParam::Content }

        # @!attribute is_error
        #
        #   @return [Boolean, nil]
        optional :is_error, Anthropic::Internal::Type::Boolean

        # @!method initialize(tool_use_id:, cache_control: nil, content: nil, is_error: nil, type: :tool_result)
        #   @param tool_use_id [String]
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param content [String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaSearchResultBlockParam, Anthropic::Models::Beta::BetaRequestDocumentBlock>]
        #
        #   @param is_error [Boolean]
        #
        #   @param type [Symbol, :tool_result]

        # @see Anthropic::Models::Beta::BetaToolResultBlockParam#content
        module Content
          extend Anthropic::Internal::Type::Union

          variant String

          variant -> { Anthropic::Models::Beta::BetaToolResultBlockParam::Content::ContentArray }

          module Content
            extend Anthropic::Internal::Type::Union

            discriminator :type

            variant :text, -> { Anthropic::Beta::BetaTextBlockParam }

            variant :image, -> { Anthropic::Beta::BetaImageBlockParam }

            variant :search_result, -> { Anthropic::Beta::BetaSearchResultBlockParam }

            variant :document, -> { Anthropic::Beta::BetaRequestDocumentBlock }

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaSearchResultBlockParam, Anthropic::Models::Beta::BetaRequestDocumentBlock)]
          end

          # @!method self.variants
          #   @return [Array(String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaSearchResultBlockParam, Anthropic::Models::Beta::BetaRequestDocumentBlock>)]

          # @type [Anthropic::Internal::Type::Converter]
          ContentArray =
            Anthropic::Internal::Type::ArrayOf[union: -> {
              Anthropic::Beta::BetaToolResultBlockParam::Content::Content
            }]
        end
      end
    end

    BetaToolResultBlockParam = Beta::BetaToolResultBlockParam
  end
end
