class RemoveRatingFromMonster < ActiveRecord::Migration[7.0]
  def change
    remove_column :monsters, :rating
    remove_column :monsters, :review_text
  end
end
