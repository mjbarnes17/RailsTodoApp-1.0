class CreateListings < ActiveRecord::Migration
  def change
    # the listings table with one column
    create_table :listings do |t|
      # description is the one column
      t.text :description
    end
  end
end
