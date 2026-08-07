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
        #   @return [String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaSearchResultBlockParam, Anthropic::Models::Beta::BetaRequestDocumentBlock, Anthropic::Models::Beta::BetaToolReferenceBlockParam>, nil]
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
        #   @param content [String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaSearchResultBlockParam, Anthropic::Models::Beta::BetaRequestDocumentBlock, Anthropic::Models::Beta::BetaToolReferenceBlockParam>]
        #
        #   @param is_error [Boolean]
        #
        #   @param type [Symbol, :tool_result]

        # @see Anthropic::Models::Beta::BetaToolResultBlockParam#content
        module Content
          extend Anthropic::Internal::Type::Union

          variant String

          variant -> { Anthropic::Models::Beta::BetaToolResultBlockParam::Content::ContentArray }

          # Tool reference block that can be included in tool_result content.
          module Content
            extend Anthropic::Internal::Type::Union

            discriminator :type

            variant :text, -> { Anthropic::Beta::BetaTextBlockParam }

            variant :image, -> { Anthropic::Beta::BetaImageBlockParam }

            variant :search_result, -> { Anthropic::Beta::BetaSearchResultBlockParam }

            variant :document, -> { Anthropic::Beta::BetaRequestDocumentBlock }

            # Tool reference block that can be included in tool_result content.
            variant :tool_reference, -> { Anthropic::Beta::BetaToolReferenceBlockParam }

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaSearchResultBlockParam, Anthropic::Models::Beta::BetaRequestDocumentBlock, Anthropic::Models::Beta::BetaToolReferenceBlockParam)]

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            #
            # @param type [Symbol, String]
            #
            # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
            #
            #   @option args [String] :text
            #
            #   @option args [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] :cache_control Create a cache control breakpoint at this content block.
            #
            #   @option args [Array<Anthropic::Models::Beta::BetaCitationCharLocationParam, Anthropic::Models::Beta::BetaCitationPageLocationParam, Anthropic::Models::Beta::BetaCitationContentBlockLocationParam, Anthropic::Models::Beta::BetaCitationWebSearchResultLocationParam, Anthropic::Models::Beta::BetaCitationSearchResultLocationParam>, nil, Anthropic::Models::Beta::BetaCitationsConfigParam, Anthropic::Models::Beta::BetaCitationsConfigParam, nil] :citations
            #
            #   @option args [Anthropic::Models::Beta::BetaBase64ImageSource, Anthropic::Models::Beta::BetaURLImageSource, Anthropic::Models::Beta::BetaFileImageSource, String, Anthropic::Models::Beta::BetaBase64PDFSource, Anthropic::Models::Beta::BetaPlainTextSource, Anthropic::Models::Beta::BetaContentBlockSource, Anthropic::Models::Beta::BetaURLPDFSource, Anthropic::Models::Beta::BetaFileDocumentSource] :source
            #
            #   @option args [Array<Anthropic::Models::Beta::BetaTextBlockParam>] :content
            #
            #   @option args [String, String, nil] :title
            #
            #   @option args [String, nil] :context
            #
            #   @option args [String] :tool_name
            #
            # @raise [ArgumentError]
            # @return [Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaSearchResultBlockParam, Anthropic::Models::Beta::BetaRequestDocumentBlock, Anthropic::Models::Beta::BetaToolReferenceBlockParam]
            def self.new(type:, **args)
              case type.to_sym
              when :text
                Anthropic::Beta::BetaTextBlockParam.new(**args)
              when :image
                Anthropic::Beta::BetaImageBlockParam.new(**args)
              when :search_result
                Anthropic::Beta::BetaSearchResultBlockParam.new(**args)
              when :document
                Anthropic::Beta::BetaRequestDocumentBlock.new(**args)
              when :tool_reference
                Anthropic::Beta::BetaToolReferenceBlockParam.new(**args)
              else
                raise ArgumentError, "unknown type: #{type}"
              end
            end
          end

          # @!method self.variants
          #   @return [Array(String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaSearchResultBlockParam, Anthropic::Models::Beta::BetaRequestDocumentBlock, Anthropic::Models::Beta::BetaToolReferenceBlockParam>)]

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
