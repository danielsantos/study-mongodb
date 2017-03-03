db.produtos.insert({
	nome : "Shampoo",
	tipo : {
		cod : 1,
		desc : "cosmético"
	}
})

db.produtos.insert({
	nome : "Camiseta",
	tipo : {
		cod : 2,
		desc : "roupa"
	}
})

db.produtos.insert({
	nome : "Bermuda",
	tipo : {
		cod : 2,
		desc : "roupa"
	}
})


db.produtos.find().pretty()

db.produtos.distinct("tipo")

db.produtos.distinct("tipo.nome")