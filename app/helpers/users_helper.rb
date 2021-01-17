# frozen_string_literal: true

module UsersHelper
  def myself?(user)
    user && current_user && current_user.id == user.id
  end

  # 谓语
  def predicate(user)
    myself?(user) ? '我' : '他'
  end
end
