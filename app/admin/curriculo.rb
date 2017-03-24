ActiveAdmin.register Curriculo do
  actions :all, except: [:update, :edit, :destroy, :create, :new]
  
  controller do
    
    def show
      @usuario = Usuario.find_by_id(params[:id])
      @curriculo = @usuario.curriculo
      @foto = @usuario.foto.url(:medium)
      @mes =@usuario.nascimento.month 
      @naturalidade = @usuario.naturalidade.to_s
      @estadocivil = @usuario.estadocivil ? @usuario.estadocivil : ""
     
      super do |format|
        format.html
        format.pdf do
           render pdf: "curriculo",
              template: "curriculos/show.pdf.erb",
              encoding: 'utf8'
        end
      end
      
    end
  end
 
  

  
  filter :idiomas, as: :select, collection: Idioma.all.map{|i| ["#{i.descricao}", "#{i.descricao}", i.id]}
  
  
end
