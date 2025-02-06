# typed: strong

module Anthropic
  module Models
    BetaCitationPageLocation = T.type_alias { Beta::BetaCitationPageLocation }

    module Beta
      class BetaCitationPageLocation < Anthropic::BaseModel
        sig { returns(String) }
        attr_accessor :cited_text

        sig { returns(Integer) }
        attr_accessor :document_index

        sig { returns(T.nilable(String)) }
        attr_accessor :document_title

        sig { returns(Integer) }
        attr_accessor :end_page_number

        sig { returns(Integer) }
        attr_accessor :start_page_number

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            cited_text: String,
            document_index: Integer,
            document_title: T.nilable(String),
            end_page_number: Integer,
            start_page_number: Integer,
            type: Symbol
          ).void
        end
        def initialize(
          cited_text:,
          document_index:,
          document_title:,
          end_page_number:,
          start_page_number:,
          type: :page_location
        )
        end

        sig do
          override.returns(
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
        def to_hash; end
      end
    end
  end
end
