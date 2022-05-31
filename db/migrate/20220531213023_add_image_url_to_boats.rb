class AddImageUrlToBoats < ActiveRecord::Migration[7.0]
  def change
    add_column :boats, :image_url, :string
  end
end
