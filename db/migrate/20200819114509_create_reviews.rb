class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :body
      t.float :rating
      t.belongs_to :movie, null: false, foreign_key: true
      t.belongs_to :user
      t.string :to

      t.timestamps
    end
  end
end
