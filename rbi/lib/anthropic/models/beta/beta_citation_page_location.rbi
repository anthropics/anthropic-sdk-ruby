# typed: strong

module Anthropic
  module Models
    module Beta
      class BetaCitationPageLocation < Anthropic::BaseModel
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
        def end_page_number
        end

        sig { params(_: Integer).returns(Integer) }
        def end_page_number=(_)
        end

        sig { returns(Integer) }
        def start_page_number
        end

        sig { params(_: Integer).returns(Integer) }
        def start_page_number=(_)
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
            end_page_number: Integer,
            start_page_number: Integer,
            type: Symbol
          )
            .returns(T.attached_class)
        end
        def self.new(cited_text:, document_index:, document_title:, end_page_number:, start_page_number:, type: :page_location)
        end

        sig do
          override
            .returns(
              {
                cited_text: String,
                document_index: Integer,
                document_title: T.nilable(String),
                end_page_number: Integer,
                start_page_number: Integer,
                type: Symbol
              }
            )
        end
        def to_hash
        end
      end
    end

    BetaCitationPageLocation = Beta::BetaCitationPageLocation
  end
end
