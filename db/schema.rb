# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_19_151916) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "username", null: false
    t.string "name", null: false
    t.string "password_digest"
    t.string "email", null: false
    t.date "birthdate"
  end

  create_table "blogs", force: :cascade do |t|
    t.string "name", null: false
    t.text "blog", null: false
    t.bigint "author_id"
    t.index ["author_id"], name: "index_blogs_on_author_id"
  end

  create_table "blogsVotes", force: :cascade do |t|
    t.integer "vote"
    t.bigint "blog_id"
    t.bigint "author_id"
    t.index ["author_id"], name: "index_blogsVotes_on_author_id"
    t.index ["blog_id"], name: "index_blogsVotes_on_blog_id"
  end

  create_table "blogs_tags", force: :cascade do |t|
    t.bigint "blog_id"
    t.bigint "tag_id"
    t.index ["blog_id"], name: "index_blogs_tags_on_blog_id"
    t.index ["tag_id"], name: "index_blogs_tags_on_tag_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "comment", null: false
    t.bigint "blog_id"
    t.bigint "author_id"
    t.index ["author_id"], name: "index_comments_on_author_id"
    t.index ["blog_id"], name: "index_comments_on_blog_id"
  end

  create_table "commentsVotes", force: :cascade do |t|
    t.integer "vote"
    t.bigint "comment_id"
    t.bigint "author_id"
    t.index ["author_id"], name: "index_commentsVotes_on_author_id"
    t.index ["comment_id"], name: "index_commentsVotes_on_comment_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
  end

end
