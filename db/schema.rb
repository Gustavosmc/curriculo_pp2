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

ActiveRecord::Schema.define(version: 20170317235301) do

  create_table "active_admin_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "namespace"
    t.text     "body",          limit: 65535
    t.string   "resource_id",                 null: false
    t.string   "resource_type",               null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_useres", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_useres_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_useres_on_reset_password_token", unique: true, using: :btree
  end

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

  create_table "cargo_pretendidos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "descricao"
    t.integer  "anos_exp"
    t.integer  "meses_exp"
    t.integer  "dias_exp"
    t.decimal  "pretensao_sal",               precision: 8, scale: 2
    t.integer  "curriculo_id"
    t.text     "observacao",    limit: 65535
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.index ["curriculo_id"], name: "index_cargo_pretendidos_on_curriculo_id", using: :btree
  end

  create_table "cargos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "descricao"
    t.date     "inicio"
    t.integer  "desenvolvimento"
    t.date     "fim"
    t.decimal  "ultimo_sal",                    precision: 8, scale: 2
    t.text     "detalhes",        limit: 65535
    t.integer  "curriculo_id"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.string   "entidade"
    t.index ["curriculo_id"], name: "index_cargos_on_curriculo_id", using: :btree
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
    t.text     "observacao",    limit: 65535
    t.integer  "usuario_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "endereco_comp"
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
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "modalidade"
    t.text     "observacao",      limit: 65535
    t.integer  "duracao"
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
    t.date     "nascimento"
    t.string   "endereco"
    t.index ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree
  end

  create_table "vagas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "requisitos", limit: 65535
    t.integer  "especial"
    t.integer  "status"
    t.integer  "setor_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "descricao"
    t.float    "salario",    limit: 24
    t.integer  "n_vagas"
    t.index ["setor_id"], name: "index_vagas_on_setor_id", using: :btree
  end

  add_foreign_key "candidatos", "usuarios"
  add_foreign_key "candidatos", "vagas"
  add_foreign_key "cargo_pretendidos", "curriculos"
  add_foreign_key "cargos", "curriculos"
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
