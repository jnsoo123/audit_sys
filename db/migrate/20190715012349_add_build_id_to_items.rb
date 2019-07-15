class AddBuildIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :build, foreign_key: true
  end
end
