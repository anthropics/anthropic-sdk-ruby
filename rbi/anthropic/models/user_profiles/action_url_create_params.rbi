# typed: strong

module Anthropic
  module Models
    module UserProfiles
      class ActionURLCreateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::UserProfiles::ActionURLCreateParams,
              Anthropic::Internal::AnyHash
            )
          end

        # The ID of the user profile the action is for (`uprof_...`).
        sig { returns(String) }
        attr_accessor :user_profile_id

        # The action that the person who opens the URL takes.
        sig { returns(Anthropic::UserProfiles::UserProfileEnrollEndUserAction) }
        attr_reader :action

        sig do
          params(
            action:
              Anthropic::UserProfiles::UserProfileEnrollEndUserAction::OrHash
          ).void
        end
        attr_writer :action

        # Optional header to select the Workspace for this request. The value is a
        # Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
        #
        # Only needed for credentials that can act on more than one Workspace. A
        # credential that belongs to a specific Workspace may omit it; if sent, it must
        # match that Workspace.
        sig { returns(T.nilable(String)) }
        attr_reader :workspace_id

        sig { params(workspace_id: String).void }
        attr_writer :workspace_id

        sig do
          params(
            user_profile_id: String,
            action:
              Anthropic::UserProfiles::UserProfileEnrollEndUserAction::OrHash,
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The ID of the user profile the action is for (`uprof_...`).
          user_profile_id:,
          # The action that the person who opens the URL takes.
          action:,
          # Optional header to select the Workspace for this request. The value is a
          # Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
          #
          # Only needed for credentials that can act on more than one Workspace. A
          # credential that belongs to a specific Workspace may omit it; if sent, it must
          # match that Workspace.
          workspace_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              user_profile_id: String,
              action: Anthropic::UserProfiles::UserProfileEnrollEndUserAction,
              workspace_id: String,
              request_options: Anthropic::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
