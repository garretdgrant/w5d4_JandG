class CreateShortenedUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :shortened_urls do |t|
      t.string "short_url", null: false, unique: true
      t.string "long_url", null: false, unique: true
      t.references :user, null: false, foreign_key:{to_table: :users}
      t.timestamps
    end
  end
end
