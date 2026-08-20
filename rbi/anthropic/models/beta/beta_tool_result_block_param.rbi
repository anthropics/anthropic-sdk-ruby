# typed: strong

module Anthropic
  module Models
    BetaToolResultBlockParam = Beta::BetaToolResultBlockParam

    module Beta
      class BetaToolResultBlockParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaToolResultBlockParam,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :tool_use_id

        sig { returns(Symbol) }
        attr_accessor :type

        # Create a cache control breakpoint at this content block.
        sig { returns(T.nilable(Anthropic::Beta::BetaCacheControlEphemeral)) }
        attr_reader :cache_control

        sig do
          params(
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash)
          ).void
        end
        attr_writer :cache_control

        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaToolResultBlockParam::Content::Variants
            )
          )
        end
        attr_reader :content

        sig do
          params(
            content:
              Anthropic::Beta::BetaToolResultBlockParam::Content::Variants
          ).void
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
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
            content:
              Anthropic::Beta::BetaToolResultBlockParam::Content::Variants,
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
              cache_control:
                T.nilable(Anthropic::Beta::BetaCacheControlEphemeral),
              content:
                Anthropic::Beta::BetaToolResultBlockParam::Content::Variants,
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
                  Anthropic::Beta::BetaToolResultBlockParam::Content::Content::Variants
                ]
              )
            end

          # Tool reference block that can be included in tool_result content.
          module Content
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::BetaTextBlockParam,
                  Anthropic::Beta::BetaImageBlockParam,
                  Anthropic::Beta::BetaSearchResultBlockParam,
                  Anthropic::Beta::BetaRequestDocumentBlock,
                  Anthropic::Beta::BetaToolReferenceBlockParam,
                  Anthropic::Beta::BetaBrowserStateBlockParam
                )
              end

            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::BetaToolResultBlockParam::Content::Content::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              TEXT =
                T.let(
                  :text,
                  Anthropic::Beta::BetaToolResultBlockParam::Content::Content::Type::TaggedSymbol
                )
              IMAGE =
                T.let(
                  :image,
                  Anthropic::Beta::BetaToolResultBlockParam::Content::Content::Type::TaggedSymbol
                )
              SEARCH_RESULT =
                T.let(
                  :search_result,
                  Anthropic::Beta::BetaToolResultBlockParam::Content::Content::Type::TaggedSymbol
                )
              DOCUMENT =
                T.let(
                  :document,
                  Anthropic::Beta::BetaToolResultBlockParam::Content::Content::Type::TaggedSymbol
                )
              TOOL_REFERENCE =
                T.let(
                  :tool_reference,
                  Anthropic::Beta::BetaToolResultBlockParam::Content::Content::Type::TaggedSymbol
                )
              BROWSER_STATE =
                T.let(
                  :browser_state,
                  Anthropic::Beta::BetaToolResultBlockParam::Content::Content::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::BetaToolResultBlockParam::Content::Content::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::BetaToolResultBlockParam::Content::Content::Variants
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
                  T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
                citations:
                  T.any(
                    T.nilable(
                      T::Array[
                        T.any(
                          Anthropic::Beta::BetaCitationCharLocationParam::OrHash,
                          Anthropic::Beta::BetaCitationPageLocationParam::OrHash,
                          Anthropic::Beta::BetaCitationContentBlockLocationParam::OrHash,
                          Anthropic::Beta::BetaCitationWebSearchResultLocationParam::OrHash,
                          Anthropic::Beta::BetaCitationSearchResultLocationParam::OrHash
                        )
                      ]
                    ),
                    Anthropic::Beta::BetaCitationsConfigParam::OrHash,
                    T.nilable(Anthropic::Beta::BetaCitationsConfigParam::OrHash)
                  ),
                source:
                  T.any(
                    T.any(
                      Anthropic::Beta::BetaBase64ImageSource::OrHash,
                      Anthropic::Beta::BetaURLImageSource::OrHash,
                      Anthropic::Beta::BetaFileImageSource::OrHash
                    ),
                    String,
                    T.any(
                      Anthropic::Beta::BetaBase64PDFSource::OrHash,
                      Anthropic::Beta::BetaPlainTextSource::OrHash,
                      Anthropic::Beta::BetaContentBlockSource::OrHash,
                      Anthropic::Beta::BetaURLPDFSource::OrHash,
                      Anthropic::Beta::BetaFileDocumentSource::OrHash
                    )
                  ),
                transformations:
                  T.nilable(
                    Anthropic::Beta::BetaImageTransformationsParam::OrHash
                  ),
                content: T::Array[Anthropic::Beta::BetaTextBlockParam::OrHash],
                title: T.any(String, T.nilable(String)),
                context: T.nilable(String),
                tool_name: String,
                tabs:
                  T::Array[Anthropic::Beta::BetaBrowserStateTabEntry::OrHash],
                state_changes:
                  T.nilable(
                    T::Array[
                      T.any(
                        Anthropic::Beta::BetaBrowserStateChangeTabOpened::OrHash,
                        Anthropic::Beta::BetaBrowserStateChangeDownloadStarted::OrHash,
                        Anthropic::Beta::BetaBrowserStateChangeDownloadCompleted::OrHash,
                        Anthropic::Beta::BetaBrowserStateChangeDownloadFailed::OrHash
                      )
                    ]
                  )
              ).returns(
                Anthropic::Beta::BetaToolResultBlockParam::Content::Content::Variants
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
              T::Array[
                Anthropic::Beta::BetaToolResultBlockParam::Content::Variants
              ]
            )
          end
          def self.variants
          end

          ContentArray =
            T.let(
              Anthropic::Internal::Type::ArrayOf[
                union:
                  Anthropic::Beta::BetaToolResultBlockParam::Content::Content
              ],
              Anthropic::Internal::Type::Converter
            )
        end
      end
    end
  end
end
