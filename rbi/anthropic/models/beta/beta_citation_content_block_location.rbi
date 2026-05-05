# typed: strong

module Anthropic
  module Models
    BetaCitationContentBlockLocation = Beta::BetaCitationContentBlockLocation

    module Beta
      class BetaCitationContentBlockLocation < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaCitationContentBlockLocation,
              Anthropic::Internal::AnyHash
            )
          end

        # The full text of the cited block range, concatenated.
        #
        # Always equals the contents of `content[start_block_index:end_block_index]`
        # joined together. The text block is the minimal citable unit; this field is never
        # a substring of a single block. Not counted toward output tokens, and not counted
        # toward input tokens when sent back in subsequent turns.
        sig { returns(String) }
        attr_accessor :cited_text

        sig { returns(Integer) }
        attr_accessor :document_index

        sig { returns(T.nilable(String)) }
        attr_accessor :document_title

        # Exclusive 0-based end index of the cited block range in the source's `content`
        # array.
        #
        # Always greater than `start_block_index`; a single-block citation has
        # `end_block_index = start_block_index + 1`.
        sig { returns(Integer) }
        attr_accessor :end_block_index

        sig { returns(T.nilable(String)) }
        attr_accessor :file_id

        # 0-based index of the first cited block in the source's `content` array.
        sig { returns(Integer) }
        attr_accessor :start_block_index

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            cited_text: String,
            document_index: Integer,
            document_title: T.nilable(String),
            end_block_index: Integer,
            file_id: T.nilable(String),
            start_block_index: Integer,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The full text of the cited block range, concatenated.
          #
          # Always equals the contents of `content[start_block_index:end_block_index]`
          # joined together. The text block is the minimal citable unit; this field is never
          # a substring of a single block. Not counted toward output tokens, and not counted
          # toward input tokens when sent back in subsequent turns.
          cited_text:,
          document_index:,
          document_title:,
          # Exclusive 0-based end index of the cited block range in the source's `content`
          # array.
          #
          # Always greater than `start_block_index`; a single-block citation has
          # `end_block_index = start_block_index + 1`.
          end_block_index:,
          file_id:,
          # 0-based index of the first cited block in the source's `content` array.
          start_block_index:,
          type: :content_block_location
        )
        end

        sig do
          override.returns(
            {
              cited_text: String,
              document_index: Integer,
              document_title: T.nilable(String),
              end_block_index: Integer,
              file_id: T.nilable(String),
              start_block_index: Integer,
              type: Symbol
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
