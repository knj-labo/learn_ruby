module Types
  class MutationType < Types::BaseObject
    field :signin_user, mutation: Mutations::SignInUser
    field :create_user, mutation: Mutations::CreateUser
    field :create_vote, mutation: Mutations::CreateVote
    field :create_link, mutation: Mutations::CreateLink
  end
end
