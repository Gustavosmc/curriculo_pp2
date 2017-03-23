ActiveAdmin.register Curriculo do
  actions :all, except: [:update, :edit, :destroy, :create, :new]

 
  
  show do 
    @usuario = curriculo.usuario
    @foto = @usuario.foto.url(:medium)
    @mes =@usuario.nascimento.month 
    @naturalidade = @usuario.naturalidade.to_s
    @estadocivil = @usuario.estadocivil ? @usuario.estadocivil : ""
    render 'curriculo', { usuario: @usuario, foto: @foto, mes: @mes, naturalidade: @naturalidade,
      estadocivil: @estadocivil, curriculo: curriculo }
  end
  
  filter :idiomas, as: :select, collection: Idioma.all.map{|i| ["#{i.descricao}", "#{i.descricao}", i.id]}
  
  
end
