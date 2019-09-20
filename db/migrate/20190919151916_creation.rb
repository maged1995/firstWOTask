class Creation < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :username, null: false, uniqueness: true
      t.string :name, null: false
      t.string :password_digest
      t.string :email, null: false
      t.date :birthdate
    end

    create_table :blogs do |t|
      t.string :name, null: false
      t.text :blog, null: false
      t.references :author
    end

    create_table :tags do |t|
      t.string :name, null: false
    end

    create_table :blogs_tags do |t|
      t.references :blog
      t.references :tag
    end

    create_table :comments do |t|
      t.text :comment, null: false
      t.references :blog
      t.references :author
    end

    create_table :blogsVotes do |t|
      t.integer :vote
      t.references :blog
      t.references :author
    end

    create_table :commentsVotes do |t|
      t.integer :vote
      t.references :comment
      t.references :author
    end
  end
end
