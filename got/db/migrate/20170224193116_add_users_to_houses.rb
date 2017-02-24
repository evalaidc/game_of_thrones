class AddUsersToHouses < ActiveRecord::Migration[5.0]
  def change
    add_reference :houses, :user, foreign_key: true
  end
end
