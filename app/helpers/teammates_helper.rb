module TeammatesHelper

  def user_can_edit_teammate(teammate, user)
    teammate.created_by == user.id && !teammate.claimed?
  end
end
