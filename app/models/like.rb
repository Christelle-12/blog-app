class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post, class_name: 'Post', foreign_key: :post_id

  after_create :update_post_likes_counter

  private

  def update_post_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end
