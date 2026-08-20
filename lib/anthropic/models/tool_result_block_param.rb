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
      #   @return [String, Array<Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam, Anthropic::Models::SearchResultBlockParam, Anthropic::Models::DocumentBlockParam, Anthropic::Models::ToolReferenceBlockParam, Anthropic::Models::BrowserStateBlockParam>, nil]
      optional :content, union: -> { Anthropic::ToolResultBlockParam::Content }

      # @!attribute is_error
      #
      #   @return [Boolean, nil]
      optional :is_error, Anthropic::Internal::Type::Boolean

      # @!attribute toolset_name
      #   For a toolset member tool_result, the toolset family of the paired tool_use.
      #
      #   @return [String, nil]
      optional :toolset_name, String, nil?: true

      # @!method initialize(tool_use_id:, cache_control: nil, content: nil, is_error: nil, toolset_name: nil, type: :tool_result)
      #   @param tool_use_id [String]
      #
      #   @param cache_control [Anthropic::Models::CacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
      #
      #   @param content [String, Array<Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam, Anthropic::Models::SearchResultBlockParam, Anthropic::Models::DocumentBlockParam, Anthropic::Models::ToolReferenceBlockParam, Anthropic::Models::BrowserStateBlockParam>]
      #
      #   @param is_error [Boolean]
      #
      #   @param toolset_name [String, nil] For a toolset member tool_result, the toolset family of the paired tool_use.
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

          # The caller's browser state after a browser toolset member call —
          # the full inventory of open tabs, which tab is active, and any side
          # effects (tabs opened, download state changes) the call produced.
          #
          # At most one per `tool_result`, only on a non-error result answering a
          # browser toolset member `tool_use`. The server renders the
          # model-visible text from it; the model never sees the raw fields.
          variant :browser_state, -> { Anthropic::BrowserStateBlockParam }

          module Type
            extend Anthropic::Internal::Type::Enum

            TEXT = :text
            IMAGE = :image
            SEARCH_RESULT = :search_result
            DOCUMENT = :document
            TOOL_REFERENCE = :tool_reference
            BROWSER_STATE = :browser_state

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam, Anthropic::Models::SearchResultBlockParam, Anthropic::Models::DocumentBlockParam, Anthropic::Models::ToolReferenceBlockParam, Anthropic::Models::BrowserStateBlockParam)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::ToolResultBlockParam::Content::Content} for more details.
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
          #   @option args [Anthropic::Models::Base64ImageSource, Anthropic::Models::URLImageSource, Anthropic::Models::FileImageSource, String, Anthropic::Models::Base64PDFSource, Anthropic::Models::PlainTextSource, Anthropic::Models::ContentBlockSource, Anthropic::Models::URLPDFSource, Anthropic::Models::FileDocumentSource] :source
          #
          #   @option args [Anthropic::Models::ImageTransformationsParam, nil] :transformations Configures the transformations the server applies to this image before the model
          #
          #   @option args [Array<Anthropic::Models::TextBlockParam>] :content
          #
          #   @option args [String, String, nil] :title
          #
          #   @option args [String, nil] :context
          #
          #   @option args [String] :tool_name
          #
          #   @option args [Array<Anthropic::Models::BrowserStateTabEntry>] :tabs All tabs open in the browser after this call — the full inventory, not a delta.
          #
          #   @option args [Array<Anthropic::Models::BrowserStateChangeTabOpened, Anthropic::Models::BrowserStateChangeDownloadStarted, Anthropic::Models::BrowserStateChangeDownloadCompleted, Anthropic::Models::BrowserStateChangeDownloadFailed>, nil] :state_changes Tabs opened and download state changes during this call. "Nothing to report" is
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam, Anthropic::Models::SearchResultBlockParam, Anthropic::Models::DocumentBlockParam, Anthropic::Models::ToolReferenceBlockParam, Anthropic::Models::BrowserStateBlockParam]
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
            when :browser_state
              Anthropic::BrowserStateBlockParam.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end

        # @!method self.variants
        #   @return [Array(String, Array<Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam, Anthropic::Models::SearchResultBlockParam, Anthropic::Models::DocumentBlockParam, Anthropic::Models::ToolReferenceBlockParam, Anthropic::Models::BrowserStateBlockParam>)]

        # @type [Anthropic::Internal::Type::Converter]
        ContentArray =
          Anthropic::Internal::Type::ArrayOf[union: -> { Anthropic::ToolResultBlockParam::Content::Content }]
      end
    end
  end
end
