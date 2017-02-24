class CreateHouses < ActiveRecord::Migration[5.0]
  def change
    create_table :houses do |t|
      t.string :name
      t.string :family_crest_url
      t.string :realm
      t.string :history

    end
  end
end
