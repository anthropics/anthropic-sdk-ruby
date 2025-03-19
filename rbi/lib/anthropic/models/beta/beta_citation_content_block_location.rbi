# typed: strong

module Anthropic
  module Models
    module Beta
      class BetaCitationContentBlockLocation < Anthropic::BaseModel
        sig { returns(String) }
        def cited_text
        end

        sig { params(_: String).returns(String) }
        def cited_text=(_)
        end

        sig { returns(Integer) }
        def document_index
        end

        sig { params(_: Integer).returns(Integer) }
        def document_index=(_)
        end

        sig { returns(T.nilable(String)) }
        def document_title
        end

        sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
        def document_title=(_)
        end

        sig { returns(Integer) }
        def end_block_index
        end

        sig { params(_: Integer).returns(Integer) }
        def end_block_index=(_)
        end

        sig { returns(Integer) }
        def start_block_index
        end

        sig { params(_: Integer).returns(Integer) }
        def start_block_index=(_)
        end

        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        sig do
          params(
            cited_text: String,
            document_index: Integer,
            document_title: T.nilable(String),
            end_block_index: Integer,
            start_block_index: Integer,
            type: Symbol
          )
            .returns(T.attached_class)
        end
        def self.new(
          cited_text:,
          document_index:,
          document_title:,
          end_block_index:,
          start_block_index:,
          type: :content_block_location
        )
        end

        sig do
          override
            .returns(
              {
                cited_text: String,
                document_index: Integer,
                document_title: T.nilable(String),
                end_block_index: Integer,
                start_block_index: Integer,
                type: Symbol
              }
            )
        end
        def to_hash
        end
      end
    end

    BetaCitationContentBlockLocation = Beta::BetaCitationContentBlockLocation
  end
end
