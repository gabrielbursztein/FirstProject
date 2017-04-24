# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate
# this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load,
# not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach
# (the more migrations
# you'll amass, the slower it'll run and the greater likelihood
# for issues).
# It's strongly recommended that you check this file into
# your version control system.

ActiveRecord::Schema.define(version: 20170420191925) do
  create_table 'active_admin_comments', force: :cascade do |t|
    t.string   'namespace'
    t.text     'body'
    t.string   'resource_id', null: false
    t.string   'resource_type', null: false
    t.string   'author_type'
    t.integer  'author_id'
    t.datetime 'created_at',  null: false
    t.datetime 'updated_at',  null: false
    t.index %w([author_type author_id]), name: 'index_active_admin_comments_on_author_type_and_author_id'
    t.index ['namespace'], name: 'index_active_admin_comments_on_namespace'
    t.index %w([resource_type resource_id]), name: 'index_active_admin_comments_on_resource_type_and_resource_id'
  end

  create_table 'admin_users', force: :cascade do |t|
    t.string   'email', default: '', null: false
    t.string   'encrypted_password', default: '', null: false
    t.string   'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer  'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string   'current_sign_in_ip'
    t.string   'last_sign_in_ip'
    t.datetime 'created_at',  null: false
    t.datetime 'updated_at',  null: false
    t.index ['email'], name: 'index_admin_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_admin_users_on_reset_password_token', unique: true
  end

  create_table 'authors', force: :cascade do |t|
    t.string   'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'average_caches', force: :cascade do |t|
    t.integer  'rater_id'
    t.string   'rateable_type'
    t.integer  'rateable_id'
    t.float    'avg', null: false
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  create_table 'books', force: :cascade do |t|
    t.string   'title'
    t.string   'description'
    t.integer  'year'
    t.datetime 'created_at',  null: false
    t.datetime 'updated_at',  null: false
    t.integer  'author_id'
    t.string   'image'
    t.index ['author_id'], name: 'index_books_on_author_id'
  end

  create_table 'comments', force: :cascade do |t|
    t.integer  'user_id'
    t.string   'description'
    t.integer  'book_id'
    t.datetime 'created_at',  null: false
    t.datetime 'updated_at',  null: false
    t.index ['book_id'], name: 'index_comments_on_book_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'overall_averages', force: :cascade do |t|
    t.string   'rateable_type'
    t.integer  'rateable_id'
    t.float    'overall_avg', null: false
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  create_table 'rates', force: :cascade do |t|
    t.integer  'rater_id'
    t.string   'rateable_type'
    t.integer  'rateable_id'
    t.float    'stars', null: false
    t.string   'dimension'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.index %w[rateable_id rateable_type], name: 'index_rates_on_rateable_id_and_rateable_type'
    t.index ['rater_id'], name: 'index_rates_on_rater_id'
  end

  create_table 'rating_caches', force: :cascade do |t|
    t.string   'cacheable_type'
    t.integer  'cacheable_id'
    t.float    'avg', null: false
    t.integer  'qty', null: false
    t.string   'dimension'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.index %w[cacheable_id cacheable_type], name: 'index_rating_caches_on_cacheable_id_and_cacheable_type'
  end

  create_table 'requests', force: :cascade do |t|
    t.integer  'book_id'
    t.integer  'user_id'
    t.integer  'status',  default: 0
    t.datetime 'created_at',  null: false
    t.datetime 'updated_at',  null: false
    t.index ['book_id'], name: 'index_requests_on_book_id'
    t.index ['user_id'], name: 'index_requests_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string   'email', default: '', null: false
    t.string   'encrypted_password', default: '', null: false
    t.string   'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer  'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string   'current_sign_in_ip'
    t.string   'last_sign_in_ip'
    t.datetime 'created_at',  null: false
    t.datetime 'updated_at',  null: false
    t.string   'name', default: '', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end
end
