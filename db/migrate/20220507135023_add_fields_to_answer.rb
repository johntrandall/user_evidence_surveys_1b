class AddFieldsToAnswer < ActiveRecord::Migration[7.0]
  def change
    add_column :answers, :name, :string
    add_column :answers, :email, :string
  end
end
