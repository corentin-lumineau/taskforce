class AddNotNullToRzalizedColumnInTask < ActiveRecord::Migration[6.0]
  def change
    change_column :tasks, :realized, :boolean, default: false
  end
end
