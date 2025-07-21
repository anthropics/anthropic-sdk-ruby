# typed: strong
# frozen_string_literal: true
# typed: true

module Anthropic
  module Helpers
    module Streaming
      class TextEvent < Anthropic::Internal::Type::BaseModel
        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(String) }
        attr_accessor :text

        sig { returns(String) }
        attr_accessor :snapshot
      end

      class CitationEvent < Anthropic::Internal::Type::BaseModel
        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(Anthropic::CitationsDelta::Citation::Variants) }
        attr_accessor :citation

        sig { returns(T::Array[Anthropic::CitationsDelta::Citation::Variants]) }
        attr_accessor :snapshot
      end

      class ThinkingEvent < Anthropic::Internal::Type::BaseModel
        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(String) }
        attr_accessor :thinking

        sig { returns(String) }
        attr_accessor :snapshot
      end

      class SignatureEvent < Anthropic::Internal::Type::BaseModel
        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(String) }
        attr_accessor :signature
      end

      class InputJsonEvent < Anthropic::Internal::Type::BaseModel
        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(String) }
        attr_accessor :partial_json

        sig { returns(T.untyped) }
        attr_accessor :snapshot
      end

      class MessageStopEvent < Anthropic::Models::RawMessageStopEvent
        sig { returns(Anthropic::Models::Message) }
        attr_accessor :message

        sig do
          params(message: Anthropic::Models::Message, type: Symbol).returns(
            T.attached_class
          )
        end
        def self.new(message:, type: :message_stop)
        end
      end

      class ContentBlockStopEvent < Anthropic::Models::RawContentBlockStopEvent
        sig { returns(Integer) }
        attr_accessor :index

        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(Anthropic::Models::ContentBlock) }
        attr_accessor :content_block

        sig do
          params(
            index: Integer,
            content_block: Anthropic::Models::ContentBlock,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(index:, content_block:, type: :content_block_stop)
        end
      end
    end
  end
end
