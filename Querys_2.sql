--

db.alunos.update(
	{"_id" : ObjectId("589b18aea88973b4fa262868")},
	{ 
		$set : { 
			localizacao : "Rua Assembléia, 10",
			estado : "Rio de Janeiro",
			pais : "Brasil",
			coordinates : [-22.904178, -43.175023],
			type : "Point"
		}
	}
)


----- 

db.alunos.insert({
	nome : "Janaina",
    localizacao : { 
		coordinates : [-22.907586, -43.176440],
		type : "Point"
	}
})

db.alunos.insert({
	nome : "Gabriel",
    localizacao : { 
		coordinates : [-22.900723, -43.179498],
		type : "Point"
	}
})

db.alunos.insert({
	nome : "Alan",
    localizacao : { 
		coordinates : [-22.901953, -43.182767],
		type : "Point"
	}
})

db.alunos.insert({
	nome : "Roberta",
    localizacao : { 
		coordinates : [-22.899999, -43.181611],
		type : "Point"
	}
})


-- IMPORTA DADOS PARA O MONGO
mongoimport -c alunos --jsonArray < alunos.json


-- definindo o indíce
db.alunos.createIndex({
	localizacao : "2dsphere"
})




db.alunos.update(
	{"_id" : ObjectId("589b18aea88973b4fa262868")},
	{ 
		$set : { 
			localizacao : {
				coordinates : [-22.904178, -43.175023],
				type : "Point"
			}
		}
	}
)



-- Quais as distancias
db.alunos.aggregate([
{
	$geoNear : {
		near : {
			coordinates : [-22.904178, -43.175023],
			type : "Point"
		},
		distanceField : "distancia.calculada",
		spherical : "Point",
		num : 4
	}
},
{ $skip : 1}
])