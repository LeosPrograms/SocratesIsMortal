class CreateSyllogisms < ActiveRecord::Migration[5.0]
  def change
    create_table :syllogisms do |t|
      t.string :title
      t.string :author
      t.string :known
      t.string :premises
      t.string :conclusion

      t.timestamps
    end
  end
end
