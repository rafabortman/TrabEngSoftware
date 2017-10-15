# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

<<<<<<< Updated upstream
ActiveRecord::Schema.define(version: 20171008181343) do
=======
ActiveRecord::Schema.define(version: 20171008162405) do
>>>>>>> Stashed changes

  create_table "amigos", force: :cascade do |t|
    t.string "usuarioId"
    t.string "amigoId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comentarios", force: :cascade do |t|
    t.integer "jogada_id"
    t.string "comentario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jogada_id"], name: "index_comentarios_on_jogada_id"
  end

  create_table "generos", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jogadas", force: :cascade do |t|
    t.string "texto_post"
    t.string "plataforma"
    t.date "data"
    t.string "categoria"
    t.string "link"
    t.integer "usuario_id"
    t.integer "jogo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "milissegundos", limit: 8
    t.index ["jogo_id"], name: "index_jogadas_on_jogo_id"
    t.index ["usuario_id"], name: "index_jogadas_on_usuario_id"
  end

  create_table "jogos", force: :cascade do |t|
    t.string "titulo"
    t.string "imagem"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "descricao"
    t.string "imagem_url"
  end

  create_table "jogos_generos", force: :cascade do |t|
    t.integer "jogo_id"
    t.integer "genero_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genero_id"], name: "index_jogos_generos_on_genero_id"
    t.index ["jogo_id"], name: "index_jogos_generos_on_jogo_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "username"
    t.string "senha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nacionalidade"
    t.string "confirmar_senha"
  end

end
