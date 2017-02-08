-- ##########FIND #############################################################################

db.alunos.find().pretty()														 

--
db.aluno.find({
    nome : "Henrique"
}).pretty()

-- 
db.aluno.find({
  $or : [
      {"curso.nome" : "Engenharia Civil"},
      {"curso.nome" : "Medicina"},
    ]
}).pretty()
																				
-- notas iguais a 10
db.alunos.find(
	{"notas" : 10.0}
)

-- notas superiores a 5
db.alunos.find(
	{"notas" : { $gt : 5}}
)

-- notas superiores a 5 trazendo apenas 1 resultado (findOne)
db.alunos.findOne(
	{"notas" : { $gt : 5}}
)

-- notas inferiores a 5
db.alunos.find(
	{"notas" : { $lt : 5}}
)

-- trazer em ordem crescente de nomes
db.alunos.find().sort({"nome" : 1}).pretty()

-- trazer em ordem alfabetica apenas os 3 primeiros
db.alunos.find().sort({"nome" : 1}).limit(3).pretty()		
						
-- ############################################################################################


-- ##########INSERT ###########################################################################

db.alunos.insert({

	nome : "Cintia",
	data_nascimento : new Date(1994, 03, 26),
	notas : [10, 4.5, 7],
	curso : {
		nome : "Sistemas de Informção"
	}

})

db.alunos.insert({

	nome : "Rodrigo",
	data_nascimento : new Date(1989, 05, 31),
	notas : [10, 8, 7],
	curso : {
		nome : "Sistemas de Informção"
	}

})

-- ############################################################################################


-- ##########UPDATE ###########################################################################

db.alunos.update(
	{ "nome" : "Camila" },
	{ $set :
		{ "nome" : "Camila Peixoto" }
	}
)

-- Update para Multiplas Linhas
db.alunos.update(
	{ "nome" : "Camila" },
	{ $set :
		{ "nome" : "Camila Peixoto" }
	},
	{
		multi : true
	}
)


db.alunos.update(
	{"_id" : ObjectId("589b18aea88973b4fa262868")},
	{ 
		$set : { 
			notas : [10, 8, 7, 9] 
		}
	}
)

db.alunos.update(
	{"_id" : ObjectId("589b18aea88973b4fa262868")},
	{ 
		$push : { 
			notas : 8.5
		}
	}
)

db.alunos.update(
	{"_id" : ObjectId("589b18aea88973b4fa262868")},
	{ 
		$push : { 
			notas : {$each : [8.5,3]}
		}
	}
)

-- ############################################################################################


-- ##########REMOVE ###########################################################################


-- ############################################################################################