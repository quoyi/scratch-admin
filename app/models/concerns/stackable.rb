# frozen_string_literal: true

module Stackable
  extend ActiveSupport::Concern

  included do
    before_create :build_stack
    # after_commit :build_stack
    # before_create :build_stack
    # before_destroy :rebuild_stack
    # after_create_commit :update_seq
    # after_destroy_commit :rebuild_seq

    # rubocop:disable Rails/ReflectionClassName
    belongs_to :prev, class_name: name, inverse_of: :after, optional: true
    has_one :after, class_name: name, dependent: :nullify, foreign_key: 'prev_id', inverse_of: :prev
    # rubocop:enable Rails/ReflectionClassName
  end

  # 同辈节点
  def peers
    self.class.where(superior_id: superior_id).order(:seq)
  end

  # 兄弟节点
  def siblings
    self.class.where('superior_id = ? AND id != ?', superior_id, id).order(:seq)
  end

  private

    def insert_head
      ActiveRecord::Base.transaction do
        peers_length = peers.length
        peers.reverse.each_with_index do |peer, index|
          if peers_length == 1
            peer.update(seq: 1)
          else
            peer_seq = peers_length + 1 - index
            peer.update(seq: peer_seq, prev_id: peers[peers_length - 1].id)
          end
        end

        # update(seq: 1)
        # peers.each_with_index { |sibling, index| sibling.update(seq: index + 2, prev_id: ) }
      end
    end

    # 构建链 self.prev_id = prev.try(:id)
    def build_stack
      self.seq = peers.count + 1
      self.prev_id = peers.last.try(:id) if superior
      # if peers.any?
      #   # 有同辈节点
      #   if peers.count > 1

      #   else
      #     self.seq = peers.count + 1
      #   end
      #   # update(prev_id: siblings.last.id)
      # else
      #   # 无同辈节点
      #   self.seq = 1
      # end
    end

    # 删除栈中: after.prev_id = prev.id; 删除栈首: after.prev_id = nil; 删除栈尾: 无需处理
    def rebuild_stack
      prev && after ? after.update(prev_id: prev.id) : after&.update(prev_id: nil)
    end

    # 插入栈中: ; 插入栈首: ; 插入栈尾: seq = peers.size
    def update_seq
      update(seq: peers.size) if superior
    end

    # 删除栈中: ; 删除栈首: ; 删除栈尾: 无需处理
    def rebuild_seq
      # update stack nodes seq
    end
end
