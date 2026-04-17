class CreateAddress < ActiveRecord::Migration[8.1]
  def change
    create_table :addresses do |t|
      t.string :title
      t.string :address1
      t.string :address2
      t.string :city
      t.string :zip
      t.string :country
      t.float  :lat
      t.float  :lng

      t.belongs_to :addressable, polymorphic: true
      t.timestamps
    end
  end
end
