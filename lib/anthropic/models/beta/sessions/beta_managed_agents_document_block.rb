# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsDocumentBlock < Anthropic::Internal::Type::BaseModel
          # @!attribute source
          #   Union type for document source variants.
          #
          #   @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsBase64DocumentSource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsPlainTextDocumentSource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsURLDocumentSource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileDocumentSource]
          required :source, union: -> { Anthropic::Beta::Sessions::BetaManagedAgentsDocumentBlock::Source }

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsDocumentBlock::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsDocumentBlock::Type }

          # @!attribute context
          #   Additional context about the document for the model.
          #
          #   @return [String, nil]
          optional :context, String, nil?: true

          # @!attribute title
          #   The title of the document.
          #
          #   @return [String, nil]
          optional :title, String, nil?: true

          # @!method initialize(source:, type:, context: nil, title: nil)
          #   Document content, either specified directly as base64 data, as text, or as a
          #   reference via a URL.
          #
          #   @param source [Anthropic::Models::Beta::Sessions::BetaManagedAgentsBase64DocumentSource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsPlainTextDocumentSource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsURLDocumentSource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileDocumentSource] Union type for document source variants.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsDocumentBlock::Type]
          #
          #   @param context [String, nil] Additional context about the document for the model.
          #
          #   @param title [String, nil] The title of the document.

          # Union type for document source variants.
          #
          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsDocumentBlock#source
          module Source
            extend Anthropic::Internal::Type::Union

            discriminator :type

            # Base64-encoded document data.
            variant :base64, -> { Anthropic::Beta::Sessions::BetaManagedAgentsBase64DocumentSource }

            # Plain text document content.
            variant :text, -> { Anthropic::Beta::Sessions::BetaManagedAgentsPlainTextDocumentSource }

            # Document referenced by URL.
            variant :url, -> { Anthropic::Beta::Sessions::BetaManagedAgentsURLDocumentSource }

            # Document referenced by file ID.
            variant :file, -> { Anthropic::Beta::Sessions::BetaManagedAgentsFileDocumentSource }

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Sessions::BetaManagedAgentsBase64DocumentSource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsPlainTextDocumentSource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsURLDocumentSource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileDocumentSource)]
          end

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsDocumentBlock#type
          module Type
            extend Anthropic::Internal::Type::Enum

            DOCUMENT = :document

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
