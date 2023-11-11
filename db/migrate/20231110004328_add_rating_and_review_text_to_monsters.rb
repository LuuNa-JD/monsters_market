class AddRatingAndReviewTextToMonsters < ActiveRecord::Migration[7.0]
  def change
    add_column :monsters, :rating, :integer
    add_column :monsters, :review_text, :text
  end
end
