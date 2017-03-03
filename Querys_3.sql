db.alunos.find({
    nome : "Daniel Rocha"
}).pretty()

db.alunos.createIndex({
	localizacao : "2dsphere"
})


db.alunos.aggregate([
{
	$geoNear : {
		near : {
			coordinates : [-22.904178, -43.175023],
			type : "Point"
		},
		distanceField : "distancia.calculada",
		spherical : "Point"
	}
}
])



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