# typed: strong

module Anthropic
  module Models
    class ToolResultBlockParam < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::ToolResultBlockParam, Anthropic::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :tool_use_id

      sig { returns(Symbol) }
      attr_accessor :type

      # Create a cache control breakpoint at this content block.
      sig { returns(T.nilable(Anthropic::CacheControlEphemeral)) }
      attr_reader :cache_control

      sig do
        params(
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash)
        ).void
      end
      attr_writer :cache_control

      sig do
        returns(T.nilable(Anthropic::ToolResultBlockParam::Content::Variants))
      end
      attr_reader :content

      sig do
        params(content: Anthropic::ToolResultBlockParam::Content::Variants).void
      end
      attr_writer :content

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_error

      sig { params(is_error: T::Boolean).void }
      attr_writer :is_error

      # For a toolset member tool_result, the toolset family of the paired tool_use.
      sig { returns(T.nilable(String)) }
      attr_accessor :toolset_name

      sig do
        params(
          tool_use_id: String,
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash),
          content: Anthropic::ToolResultBlockParam::Content::Variants,
          is_error: T::Boolean,
          toolset_name: T.nilable(String),
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        tool_use_id:,
        # Create a cache control breakpoint at this content block.
        cache_control: nil,
        content: nil,
        is_error: nil,
        # For a toolset member tool_result, the toolset family of the paired tool_use.
        toolset_name: nil,
        type: :tool_result
      )
      end

      sig do
        override.returns(
          {
            tool_use_id: String,
            type: Symbol,
            cache_control: T.nilable(Anthropic::CacheControlEphemeral),
            content: Anthropic::ToolResultBlockParam::Content::Variants,
            is_error: T::Boolean,
            toolset_name: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      module Content
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              String,
              T::Array[
                Anthropic::ToolResultBlockParam::Content::Content::Variants
              ]
            )
          end

        # Tool reference block that can be included in tool_result content.
        module Content
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::TextBlockParam,
                Anthropic::ImageBlockParam,
                Anthropic::SearchResultBlockParam,
                Anthropic::DocumentBlockParam,
                Anthropic::ToolReferenceBlockParam,
                Anthropic::BrowserStateBlockParam
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::ToolResultBlockParam::Content::Content::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            TEXT =
              T.let(
                :text,
                Anthropic::ToolResultBlockParam::Content::Content::Type::TaggedSymbol
              )
            IMAGE =
              T.let(
                :image,
                Anthropic::ToolResultBlockParam::Content::Content::Type::TaggedSymbol
              )
            SEARCH_RESULT =
              T.let(
                :search_result,
                Anthropic::ToolResultBlockParam::Content::Content::Type::TaggedSymbol
              )
            DOCUMENT =
              T.let(
                :document,
                Anthropic::ToolResultBlockParam::Content::Content::Type::TaggedSymbol
              )
            TOOL_REFERENCE =
              T.let(
                :tool_reference,
                Anthropic::ToolResultBlockParam::Content::Content::Type::TaggedSymbol
              )
            BROWSER_STATE =
              T.let(
                :browser_state,
                Anthropic::ToolResultBlockParam::Content::Content::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::ToolResultBlockParam::Content::Content::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::ToolResultBlockParam::Content::Content::Variants
              ]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type: T.any(Symbol, String),
              text: String,
              cache_control:
                T.nilable(Anthropic::CacheControlEphemeral::OrHash),
              citations:
                T.any(
                  T.nilable(
                    T::Array[
                      T.any(
                        Anthropic::CitationCharLocationParam::OrHash,
                        Anthropic::CitationPageLocationParam::OrHash,
                        Anthropic::CitationContentBlockLocationParam::OrHash,
                        Anthropic::CitationWebSearchResultLocationParam::OrHash,
                        Anthropic::CitationSearchResultLocationParam::OrHash
                      )
                    ]
                  ),
                  Anthropic::CitationsConfigParam::OrHash,
                  T.nilable(Anthropic::CitationsConfigParam::OrHash)
                ),
              source:
                T.any(
                  T.any(
                    Anthropic::Base64ImageSource::OrHash,
                    Anthropic::URLImageSource::OrHash,
                    Anthropic::FileImageSource::OrHash
                  ),
                  String,
                  T.any(
                    Anthropic::Base64PDFSource::OrHash,
                    Anthropic::PlainTextSource::OrHash,
                    Anthropic::ContentBlockSource::OrHash,
                    Anthropic::URLPDFSource::OrHash,
                    Anthropic::FileDocumentSource::OrHash
                  )
                ),
              transformations:
                T.nilable(Anthropic::ImageTransformationsParam::OrHash),
              content: T::Array[Anthropic::TextBlockParam::OrHash],
              title: T.any(String, T.nilable(String)),
              context: T.nilable(String),
              tool_name: String,
              tabs: T::Array[Anthropic::BrowserStateTabEntry::OrHash],
              state_changes:
                T.nilable(
                  T::Array[
                    T.any(
                      Anthropic::BrowserStateChangeTabOpened::OrHash,
                      Anthropic::BrowserStateChangeDownloadStarted::OrHash,
                      Anthropic::BrowserStateChangeDownloadCompleted::OrHash,
                      Anthropic::BrowserStateChangeDownloadFailed::OrHash
                    )
                  ]
                )
            ).returns(
              Anthropic::ToolResultBlockParam::Content::Content::Variants
            )
          end
          def self.new(
            type:,
            text: nil,
            # Create a cache control breakpoint at this content block.
            cache_control: nil,
            citations: nil,
            source: nil,
            # Configures the transformations the server applies to this image before the model
            # observes it. Each key names a condition the server transforms images for; its
            # value selects the transformation applied. Omitted keys keep their default
            # behavior, and an empty object is equivalent to omitting the field.
            transformations: nil,
            content: nil,
            title: nil,
            context: nil,
            tool_name: nil,
            # All tabs open in the browser after this call — the full inventory, not a delta.
            # May be empty. Whenever non-empty, exactly one entry carries `active: true`.
            tabs: nil,
            # Tabs opened and download state changes during this call. "Nothing to report" is
            # expressed by omitting the field, never by an empty list.
            state_changes: nil
          )
          end
        end

        sig do
          override.returns(
            T::Array[Anthropic::ToolResultBlockParam::Content::Variants]
          )
        end
        def self.variants
        end

        ContentArray =
          T.let(
            Anthropic::Internal::Type::ArrayOf[
              union: Anthropic::ToolResultBlockParam::Content::Content
            ],
            Anthropic::Internal::Type::Converter
          )
      end
    end
  end
end
