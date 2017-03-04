 
idioma = Idioma.create descricao: 'Português', status: 1

setor = Setor.create descricao: "Mercado", status: 1

vaga = Vaga.create descricao: "Vaga para gerente", requisitos: "Saber inglês", especial: 1, status: 1,
        setor: setor, salario: 1200.00
      
        Vaga.create descricao: "Vaga para gerente", requisitos: "Uma vaga para uma pessoa trabalhar
        Uma vaga para uma pessoa trabalhar Uma vaga para uma pessoa trabalhar", especial: 1, status: 1,
        setor: setor, salario: 1200.00
        Vaga.create descricao: "Vaga para gerente", requisitos: "Saber inglês", especial: 1, status: 1,
        setor: setor, salario: 1200.00
        Vaga.create descricao: "Vaga para gerente", requisitos: "Saber inglês", especial: 1, status: 1,
        setor: setor, salario: 1200.00
        Vaga.create descricao: "Vaga para gerente", requisitos: "Saber inglês", especial: 1, status: 1,
        setor: setor, salario: 1200.00
        Vaga.create descricao: "Vaga para gerente", requisitos: "Saber inglês", especial: 1, status: 1,
        setor: setor, salario: 1200.00
            Vaga.create descricao: "Vaga para gerente", requisitos: "Uma vaga para uma pessoa trabalhar
        Uma vaga para uma pessoa trabalhar Uma vaga para uma pessoa trabalhar", especial: 1, status: 1,
        setor: setor, salario: 1200.00
        Vaga.create descricao: "Vaga para gerente", requisitos: "Saber inglês", especial: 1, status: 1,
        setor: setor, salario: 1200.00
        Vaga.create descricao: "Vaga para gerente", requisitos: "Saber inglês", especial: 1, status: 1,
        setor: setor, salario: 1200.00
        Vaga.create descricao: "Vaga para gerente", requisitos: "Saber inglês", especial: 1, status: 1,
        setor: setor, salario: 1200.00
        Vaga.create descricao: "Vaga para gerente", requisitos: "Saber inglês", especial: 1, status: 1,
        setor: setor, salario: 1200.00
        
        
        
curriculo = Curriculo.create observacao: "Uma observação", endereco_comp: "Rua: tal N 44 Bairro: Centro Unai-MG"

usuario = Usuario.create nome: "Gustavo", resumo: "Um resumo qualquer", cpf: "12345678901", datanascimento: '2017/01/01',
            sexo: 1, estadocivil: 1, telefone: "999999999", email: "luizgustavosmc@gmail.com", naturalidade: "Brasil",
            tipo: 1, status: 1, password: "111111", curriculo: curriculo, nascimento: "12-07-1993"


idiomacurriculo = IdiomaCurriculo.create le: 1, fala: 1, escreve: 1, status: 1, curriculo: curriculo, idioma: idioma

titulo = Titulo.create descricao: "Uma descricao", entidade: "Uma entidade", ano: 2017, desenvolvimento: 1,
         grau: 1, status: 1, curriculo: curriculo
         
contratacao = Contratacao.create status: 1, usuario: usuario, vaga: vaga, setor: setor

candidato = Candidato.create usuario: usuario, vaga: vaga, observacao: "Quero muito essa vaga",
            status: 1