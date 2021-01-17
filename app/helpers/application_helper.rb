# frozen_string_literal: true

module ApplicationHelper
  # 表格树
  def draw_tree(partial:, object:, **opts)
    concat(render(partial, object: object, **opts)) unless object.superior

    object.juniors.each do |junior|
      next unless junior

      concat(render(partial, object: junior, **opts))
      draw_tree(partial: partial, object: junior, **opts) if junior.juniors
    end
  end
end
