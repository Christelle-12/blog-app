# frozen_string_literal: true

class RenameUserIdInComments < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :user_id, :author_id
  end
end
