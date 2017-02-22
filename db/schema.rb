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

ActiveRecord::Schema.define(version: 20170219165940) do

  create_table "candidatos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "vaga_id"
    t.integer  "usuario_id"
    t.boolean  "contratado"
    t.text     "observacao", limit: 65535
    t.integer  "status"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["usuario_id"], name: "index_candidatos_on_usuario_id", using: :btree
    t.index ["vaga_id"], name: "index_candidatos_on_vaga_id", using: :btree
  end

  create_table "contratacoes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "status"
    t.integer  "usuario_id"
    t.integer  "vaga_id"
    t.integer  "setor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["setor_id"], name: "index_contratacoes_on_setor_id", using: :btree
    t.index ["usuario_id"], name: "index_contratacoes_on_usuario_id", using: :btree
    t.index ["vaga_id"], name: "index_contratacoes_on_vaga_id", using: :btree
  end

  create_table "curriculos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "observacao",  limit: 65535
    t.integer  "experiencia"
    t.integer  "usuario_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["usuario_id"], name: "index_curriculos_on_usuario_id", using: :btree
  end

  create_table "idioma_curriculos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "le"
    t.integer  "fala"
    t.integer  "escreve"
    t.integer  "status"
    t.integer  "curriculo_id"
    t.integer  "idioma_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["curriculo_id"], name: "index_idioma_curriculos_on_curriculo_id", using: :btree
    t.index ["idioma_id"], name: "index_idioma_curriculos_on_idioma_id", using: :btree
  end

  create_table "idiomas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "descricao"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "setores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "descricao"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "titulos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "descricao"
    t.string   "entidade"
    t.integer  "ano"
    t.integer  "desenvolvimento"
    t.integer  "grau"
    t.integer  "status"
    t.integer  "curriculo_id"
    t.integer  "usuario_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["curriculo_id"], name: "index_titulos_on_curriculo_id", using: :btree
    t.index ["usuario_id"], name: "index_titulos_on_usuario_id", using: :btree
  end

  create_table "usuarios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "resumo",                 limit: 65535
    t.string   "nome"
    t.string   "cpf"
    t.date     "datanascimento"
    t.integer  "sexo"
    t.integer  "estadocivil"
    t.string   "telefone"
    t.string   "naturalidade"
    t.integer  "tipo"
    t.integer  "status"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
    t.index ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree
  end

  create_table "vagas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "datahorac"
    t.text     "requisitos", limit: 65535
    t.integer  "especial"
    t.integer  "status"
    t.integer  "setor_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "descricao"
    t.index ["setor_id"], name: "index_vagas_on_setor_id", using: :btree
  end

  add_foreign_key "candidatos", "usuarios"
  add_foreign_key "candidatos", "vagas"
  add_foreign_key "contratacoes", "setores"
  add_foreign_key "contratacoes", "usuarios"
  add_foreign_key "contratacoes", "vagas"
  add_foreign_key "curriculos", "usuarios"
  add_foreign_key "idioma_curriculos", "curriculos"
  add_foreign_key "idioma_curriculos", "idiomas"
  add_foreign_key "titulos", "curriculos"
  add_foreign_key "titulos", "usuarios"
  add_foreign_key "vagas", "setores"
end
