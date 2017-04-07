ActiveAdmin.register Candidato do
  menu false
  actions :all, except: [ :new, :create, :destroy, :edit, :update]
  
   member_action :cancelar, method: [:get, :put] do
    respond_to do |format|
        @candidato = Candidato.find_by_id(params[:id])
        if Candidato.status[@candidato.status] == 0
          format.html { redirect_to admin_candidatos_url, notice: 'Candidato já está cancelado' }
        elsif Candidato.status[@candidato.status] == 2
          format.html { redirect_to admin_candidatos_url, notice: 'Candidato já está desclassificado' }
        else
          @candidato.status = 2
          if @candidato.save
            format.html { redirect_to admin_candidatos_url, notice: 'Candidato desclassificado' }
          end
        end
    end
  end
  
   member_action :contratar, method: [:get, :put] do
    respond_to do |format|
       candidato = Candidato.find_by_id(params[:id])
       contratacao = Contratacao.new(usuario: candidato.usuario, vaga: candidato.vaga, setor: candidato.vaga.setor)
       if contratacao.save
         vaga = candidato.vaga
         if vaga.update status: 2 and candidato.update status: 3, contratado: true
           format.html { redirect_to admin_contratacoes_url, notice: 'Contratação criada com sucesso' }
         else
           format.html { redirect_to admin_contratacoes_url, notice: 'Falha ao criar contratação' }
         end
       else
         format.html { redirect_to admin_contratacoes_url, notice: 'Está vaga já está ocupada' }
       end
    end
  end
  
  
  
  
 controller do
   
    def scoped_collection
      if params.has_key? :vaga
        super.where(vaga_id: params[:vaga])
      else
        super
      end
    end
  
   
 end
 
 
 
 
 index do
   selectable_column
      id_column
      column :usuario do |c|
        c.usuario.nome
      end
      column :observacao
      column :status
      column :contratado
   
      actions defaults: true, method: :put do |candidato|
        if candidato.status == "AGUARDANDO"  
          link_to 'Desclassificar', cancelar_admin_candidato_path(candidato),
              data: { confirm: 'Deseja desclassificar este candidato?'}
        end
      end
      
       actions defaults: false, method: :put do |candidato|
        link_to 'Contratar', contratar_admin_candidato_path(candidato),
            data: { confirm: 'Deseja contratar este candidato? Isso irá fechar a vaga'}
      end
      
      actions defaults: false, method: :put do |candidato|
        link_to 'Ver Curriculo', admin_curriculo_path(candidato.usuario.curriculo)
      end
  
 end
 
  # member_action :ver_curriculo, method: [:get, :put] do
  #   render "show"
  # end
 
 
 
 filter :status, as: :select, collection: Candidato.status

end
