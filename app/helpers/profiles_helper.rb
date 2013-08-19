module ProfilesHelper
  def can_favorite?(profile)
    current_user && current_user.coach? && current_user.id != profile.id
  end
end
