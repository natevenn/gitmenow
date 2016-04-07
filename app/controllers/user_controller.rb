class UserController < ApplicationController
  def show
    @repos = Repo.all(current_user)
    @followers = Follower.all(current_user)
    @followings = Following.all(current_user)
    @gists = Gist.all(current_user)
    @organizations = Organization.all(current_user)
    @push_events = PushEvent.all(current_user)
    @pull_events = PullEvent.all(current_user)
    @stars = Repo.count_stars(@repos)
  end
end
