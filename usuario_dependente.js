db.dependente.insert({_id : 1, nome : "Cintia"})

db.dependente.insert({_id : 2, nome : "Leonardo"})

db.usuario.insert({
	nome : "Francisco",
	dependente_id : [1,2]		
})

db.usuario.aggregate([
    {
      $lookup:
        {
          from : "dependente",
          localField : "dependente_id",
          foreignField: "_id",
          as: "dependentes"
        }
   }
]).pretty()