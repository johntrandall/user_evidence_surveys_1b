class RenameResponseToAnswer < ActiveRecord::Migration[7.0]
  def change
    rename_table :responses, :answers
  end
end
