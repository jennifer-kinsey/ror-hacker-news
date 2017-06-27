class Setup < ActiveRecord::Migration[5.0]
  def change
    enable_extension "pgcrypto"

    create_table :links, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :link_url
      t.string :description
      t.string :user
      t.integer :rank

      t.timestamps
    end

    create_table :comments, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :user
      t.uuid :link_id
      t.string :comments
      t.integer :rank

      t.timestamps
    end
  end
end
