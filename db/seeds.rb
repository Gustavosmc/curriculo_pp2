 
idioma = Idioma.create descricao: 'Português', status: 1
Idioma.create descricao: 'Inglês', status: 1
Idioma.create descricao: 'Espanhol', status: 1

# Para apresentação
setor = Setor.create descricao: "Mercado", status: 1
setor2 = Setor.create descricao: "Posto de Combustivel", status: 1
setor3 = Setor.create descricao: "Fabrica de Ração", status: 1

vaga = Vaga.create descricao: "Caixa no setor de veterinária", requisitos: "Ter ensino médio completo, ser portador de necessidades especiais", especial: 1, status: 1,
        setor: setor, salario: 970.00
vaga2 = Vaga.create descricao: "Empacotador de mercadorias", requisitos: "Ter no mínimo 4 meses de experiência", especial: 0, status: 1,
        setor: setor, salario: 970.00
vaga3 = Vaga.create descricao: "Frentista de posto", requisitos: "Ter no mínimo 2 anos de experiência", especial: 0, status: 1,
        setor: setor2, salario: 1200.00        
vaga4 = Vaga.create descricao: "Gerente do setor rações", requisitos: "Saber administrar pessoas, e ter experiência nesse cargo", especial: 0, status: 1,
        setor: setor3, salario: 1200.00           
        
admin = AdminUser.create email: 'admin@admin.com', password: '111111', password_confirmation: '111111'


curriculo = Curriculo.create observacao: "Uma observação"

usuario =  Usuario.create nome: "Gustavo", resumo: "Um resumo qualquer", cpf: "12179619685", datanascimento: '12/07/1992',
            sexo: 1, estadocivil: 1, telefone: "999999999", email: "luizgustavosmc@gmail.com", naturalidade: "MG",
            status: 1, password: "111111", curriculo: curriculo, nascimento: '12/07/1992', endereco: "Rua tal n 666"


idiomacurriculo = IdiomaCurriculo.create le: 1, fala: 1, escreve: 1, status: 1, curriculo: curriculo, idioma: idioma

titulo = Titulo.create descricao: "Uma descricao", entidade: "Uma entidade", ano: 2017, desenvolvimento: 1,
        grau: 1, status: 1, curriculo: curriculo
         
contratacao = Contratacao.create status: 1, usuario: usuario, vaga: vaga, setor: setor

candidato = Candidato.create usuario: usuario, vaga: vaga, observacao: "Quero muito essa vaga"
            
            
