# typed: strong

module Anthropic
  module Models
    BetaBrowserFileUploadInput = Beta::BetaBrowserFileUploadInput

    module Beta
      class BetaBrowserFileUploadInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBrowserFileUploadInput,
              Anthropic::Internal::AnyHash
            )
          end

        # An element on the page, identified by a reference from a prior `read_page` or
        # `find` result. References are scoped to the tab that produced them and become
        # stale after navigation or a major re-render.
        sig { returns(Anthropic::Beta::BetaBrowserRefTarget) }
        attr_reader :target

        sig do
          params(target: Anthropic::Beta::BetaBrowserRefTarget::OrHash).void
        end
        attr_writer :target

        # References to files the harness has staged, for deployments where the browser
        # executor cannot read the caller's filesystem.
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :document_ids

        # File paths on the browser executor's filesystem.
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :paths

        # Tab to act on. Defaults to the active tab when omitted.
        sig { returns(T.nilable(String)) }
        attr_accessor :tab_id

        # Set the value of a file-input element to one or more files. The target must be
        # an element reference; at least one of paths or document_ids is required.
        sig do
          params(
            target: Anthropic::Beta::BetaBrowserRefTarget::OrHash,
            document_ids: T.nilable(T::Array[String]),
            paths: T.nilable(T::Array[String]),
            tab_id: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # An element on the page, identified by a reference from a prior `read_page` or
          # `find` result. References are scoped to the tab that produced them and become
          # stale after navigation or a major re-render.
          target:,
          # References to files the harness has staged, for deployments where the browser
          # executor cannot read the caller's filesystem.
          document_ids: nil,
          # File paths on the browser executor's filesystem.
          paths: nil,
          # Tab to act on. Defaults to the active tab when omitted.
          tab_id: nil
        )
        end

        sig do
          override.returns(
            {
              target: Anthropic::Beta::BetaBrowserRefTarget,
              document_ids: T.nilable(T::Array[String]),
              paths: T.nilable(T::Array[String]),
              tab_id: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
