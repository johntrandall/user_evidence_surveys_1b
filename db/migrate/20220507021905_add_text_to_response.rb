class AddTextToResponse < ActiveRecord::Migration[7.0]
  def change
    add_column :responses, :text, :string
  end
end
