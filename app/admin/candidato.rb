ActiveAdmin.register Candidato do
  controller do
    
    def destroy
      @candidato = Candidato.find_by_id(params[:id])
      @candidato.status = 2
       respond_to do |format|
        if @candidato.save
          format.html { redirect_to admin_candidatos_url, notice: 'Candidato Desclassificado' }
        end
       end
    end
  end
 

end
