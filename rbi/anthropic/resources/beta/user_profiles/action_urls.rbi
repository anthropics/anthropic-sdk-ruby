# typed: strong

module Anthropic
  module Resources
    class Beta
      class UserProfiles
        class ActionURLs
          # Create Action URL
          sig do
            params(
              user_profile_id: String,
              action:
                Anthropic::Beta::UserProfiles::BetaUserProfileEnrollEndUserAction::OrHash,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              workspace_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::UserProfiles::BetaUserProfileActionURL)
          end
          def create(
            # Path param: The ID of the user profile the action is for (`uprof_...`).
            user_profile_id,
            # Body param: The action that the person who opens the URL takes.
            action:,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            # Header param: Optional header to select the Workspace for this request. The
            # value is a Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
            #
            # Only needed for credentials that can act on more than one Workspace. A
            # credential that belongs to a specific Workspace may omit it; if sent, it must
            # match that Workspace.
            workspace_id: nil,
            request_options: {}
          )
          end

          # @api private
          sig { params(client: Anthropic::Client).returns(T.attached_class) }
          def self.new(client:)
          end
        end
      end
    end
  end
end
