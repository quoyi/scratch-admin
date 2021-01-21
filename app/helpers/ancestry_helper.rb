# frozen_string_literal: true

# rubocop:disable Metrics/CyclomaticComplexity,Metrics/MethodLength,Metrics/PerceivedComplexity
module AncestryHelper
  # arranged as tree expects 3 arguments. The hash from has_ancestry.arrange() method,
  # options, and a render block
  def arranged_tree_as_list(hash, options = {}, &block)
    options = {
      list_type: :ul,
      list_style: '',
      ul_class: [],
      ul_class_top: [],
      ul_class_children: [],
      li_class: [],
      li_class_top: [],
      li_class_children: [],
      sort_by: []
    }.merge(options)

    # setup any custom list styles you want to use here. An example is excluded
    # to render bootstrap style list groups. This is used to keep from recoding the same
    # options on different lists
    case options[:list_style]
    when :bootstrap_list_group
      options[:ul_class] << ['list-group']
      options[:li_class] << ['list-group-item']
    end
    options[:list_style] = ''

    # sort the hash key based on sort_by options array
    unless options[:sort_by].empty?
      hash = Hash[hash.sort_by { |k, _v| options[:sort_by].collect { |sort| k.send(sort) } }]
    end

    output = []
    current_depth = 0
    hash.each do |object, children|
      li_classes = options[:li_class]
      li_classes += if object.depth == 0
                      options[:li_class_top]
                    else
                      options[:li_class_children]
                    end

      if !children.empty?
        substree = safe_join(arranged_tree_as_list(children, options, &block))
        output << tag.li(capture(object, &block) + substree, class: li_classes)
      else
        output << tag.li(capture(object, &block), class: li_classes)
        current_depth = object.depth
      end
    end

    if output.present?
      ul_classes = options[:ul_class]
      ul_classes += if current_depth == 0
                      options[:ul_class_top]
                    else
                      options[:ul_class_children]
                    end

      output = content_tag(options[:list_type], safe_join(output), class: ul_classes)
    end

    # rubocop:disable Rails/OutputSafety
    output.html_safe # safe_join(output)
    # rubocop:enable Rails/OutputSafety
  end

  # Recursively render a partial from an Ancestry arranged subtree.
  def arranged_tree_table_rows(tree)
    tree.each do |node, children|
      concat render partial: 'tree_node', object: node
      arranged_tree_table_rows(children) if children.present?
    end
  end
end
# rubocop:enable Metrics/CyclomaticComplexity,Metrics/MethodLength,Metrics/PerceivedComplexity
