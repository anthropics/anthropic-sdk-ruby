# typed: strong

module Anthropic
  module Models
    class SkillDeleteParams < Anthropic::Internal::Type::BaseModel
      extend Anthropic::Internal::Type::RequestParameters::Converter
      include Anthropic::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Anthropic::SkillDeleteParams, Anthropic::Internal::AnyHash)
        end

      # Unique identifier for the skill.
      #
      # The format and length of IDs may change over time.
      sig { returns(String) }
      attr_accessor :skill_id

      sig do
        params(
          skill_id: String,
          request_options: Anthropic::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the skill.
        #
        # The format and length of IDs may change over time.
        skill_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { skill_id: String, request_options: Anthropic::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
