# frozen_string_literal: true

module Anthropic
  module Models
    class ToolResultBlockParam < Anthropic::Internal::Type::BaseModel
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
      #   @return [Anthropic::Models::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::CacheControlEphemeral }, nil?: true

      # @!attribute content
      #
      #   @return [String, Array<Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam, Anthropic::Models::SearchResultBlockParam, Anthropic::Models::DocumentBlockParam, Anthropic::Models::ToolReferenceBlockParam>, nil]
      optional :content, union: -> { Anthropic::ToolResultBlockParam::Content }

      # @!attribute is_error
      #
      #   @return [Boolean, nil]
      optional :is_error, Anthropic::Internal::Type::Boolean

      # @!method initialize(tool_use_id:, cache_control: nil, content: nil, is_error: nil, type: :tool_result)
      #   @param tool_use_id [String]
      #
      #   @param cache_control [Anthropic::Models::CacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
      #
      #   @param content [String, Array<Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam, Anthropic::Models::SearchResultBlockParam, Anthropic::Models::DocumentBlockParam, Anthropic::Models::ToolReferenceBlockParam>]
      #
      #   @param is_error [Boolean]
      #
      #   @param type [Symbol, :tool_result]

      # @see Anthropic::Models::ToolResultBlockParam#content
      module Content
        extend Anthropic::Internal::Type::Union

        variant String

        variant -> { Anthropic::Models::ToolResultBlockParam::Content::ContentArray }

        # Tool reference block that can be included in tool_result content.
        module Content
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :text, -> { Anthropic::TextBlockParam }

          variant :image, -> { Anthropic::ImageBlockParam }

          variant :search_result, -> { Anthropic::SearchResultBlockParam }

          variant :document, -> { Anthropic::DocumentBlockParam }

          # Tool reference block that can be included in tool_result content.
          variant :tool_reference, -> { Anthropic::ToolReferenceBlockParam }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam, Anthropic::Models::SearchResultBlockParam, Anthropic::Models::DocumentBlockParam, Anthropic::Models::ToolReferenceBlockParam)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [String] :text
          #
          #   @option args [Anthropic::Models::CacheControlEphemeral, nil] :cache_control Create a cache control breakpoint at this content block.
          #
          #   @option args [Array<Anthropic::Models::CitationCharLocationParam, Anthropic::Models::CitationPageLocationParam, Anthropic::Models::CitationContentBlockLocationParam, Anthropic::Models::CitationWebSearchResultLocationParam, Anthropic::Models::CitationSearchResultLocationParam>, nil, Anthropic::Models::CitationsConfigParam, Anthropic::Models::CitationsConfigParam, nil] :citations
          #
          #   @option args [Anthropic::Models::Base64ImageSource, Anthropic::Models::URLImageSource, String, Anthropic::Models::Base64PDFSource, Anthropic::Models::PlainTextSource, Anthropic::Models::ContentBlockSource, Anthropic::Models::URLPDFSource] :source
          #
          #   @option args [Array<Anthropic::Models::TextBlockParam>] :content
          #
          #   @option args [String, String, nil] :title
          #
          #   @option args [String, nil] :context
          #
          #   @option args [String] :tool_name
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam, Anthropic::Models::SearchResultBlockParam, Anthropic::Models::DocumentBlockParam, Anthropic::Models::ToolReferenceBlockParam]
          def self.new(type:, **args)
            case type.to_sym
            when :text
              Anthropic::TextBlockParam.new(**args)
            when :image
              Anthropic::ImageBlockParam.new(**args)
            when :search_result
              Anthropic::SearchResultBlockParam.new(**args)
            when :document
              Anthropic::DocumentBlockParam.new(**args)
            when :tool_reference
              Anthropic::ToolReferenceBlockParam.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end

        # @!method self.variants
        #   @return [Array(String, Array<Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam, Anthropic::Models::SearchResultBlockParam, Anthropic::Models::DocumentBlockParam, Anthropic::Models::ToolReferenceBlockParam>)]

        # @type [Anthropic::Internal::Type::Converter]
        ContentArray =
          Anthropic::Internal::Type::ArrayOf[union: -> { Anthropic::ToolResultBlockParam::Content::Content }]
      end
    end
  end
end
