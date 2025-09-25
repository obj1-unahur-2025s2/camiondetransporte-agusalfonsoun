import cosas.*
object camion {
  const carga = []

  method cargar(unaCosa) {
    carga.add(unaCosa)
  }

  method descargar(unaCosa) {
    carga.remove(unaCosa)
  }

  method pesoTotal() = carga.sum({c => c.peso()}) + 1000

  method todosPesoPar() = carga.all({c => c.esPesoPar()})

  method hayUnaCosaConPeso(unPeso) = carga.any({c => c.peso() == unPeso})

  method primeraCosaConNivelDePeligrosidad(unValor) = carga.find({c => c.peligrosidad() == unValor}) 

  method todasLasCosasQueSuperan(unValor) {
    return carga.filter({c => c.peligrosidad() > unValor})
  }

   method todasLasCosasQueSuperanNivelDePeligrosidadDe(unaCosa) {
    return carga.filter({c => c.peligrosidad() > unaCosa.peligrosidad()})
  }


  method estaExedidoDePeso() = self.pesoTotal() > 2500

  method puedeCircular(unValor) {
    return !self.estaExedidoDePeso() || 
  }
}