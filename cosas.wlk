object knightRider {
  method peso() = 500
  method peligrosidad() = 10
  method esPesoPar() = self.peso().even() 
}

object bumblebee {
  var esAuto = true
  method peso() = 800
  method transformarseEnAuto() {
    esAuto = true
  }
  method transformarseEnRobot() {
    esAuto = false
  }
  method peligrosidad() = if (esAuto) 15 else 30
  method esPesoPar() = self.peso().even() 
}

object ladrillos {
  var cantidad = 10
  method cantidaa(nuevaCantidad) {
    cantidad = nuevaCantidad
  } 

  method peso() {
    return 2 * cantidad
  }

  method peligrosidad() = 2
  method esPesoPar() = self.peso().even()
}

object arena {
  var peso = 0
  method peso() {
    return peso
  }

  method peso(nuevoPeso) {
    peso = nuevoPeso
  }

  method peligrosidad() = 1
  method esPesoPar() = self.peso().even()
}

object bateriaAntiaerea {
  var estaConMisiles = false
  method peso() = if (estaConMisiles) 300 else 200
  method peligrosidad() = if (estaConMisiles) 100 else 0

  method cargarMisiles() {
    estaConMisiles = true
  }
  method descargarMisiles() {
    estaConMisiles = false
  }
  method esPesoPar() = self.peso().even()
}

object contenedorPortuario {
  const cosasDentro = []
  method peso() {
    return 100 + cosasDentro.sum({c => c.peso()})
  }

  method peligrosidad() = if (cosasDentro.isEmpty()) 0 else cosasDentro.max({c => c.peligrosidad()}).peligrosidad()

  method cargar(unaCosa) {
    cosasDentro.add(unaCosa)
  }
  method cargarVarias(variasCosas) {
    cosasDentro.addAll(variasCosas)
  }
  method descargar(unaCosa) {
    cosasDentro.remove(unaCosa)
  }
  method esPesoPar() = self.peso().even()
}

object residuosRadiactivos {
  var property peso = 0
  method peligrosidad() = 200
  method esPesoPar() = self.peso().even()
}

object embalajeDeSeguridad {
  var cosaEmbalada = residuosRadiactivos

  method embalar(unaCosa) {
    cosaEmbalada = unaCosa
  }

  method peso() = cosaEmbalada.peso()
  method peligrosidad() = cosaEmbalada.peligrosidad() / 2
  method esPesoPar() = self.peso().even() 
}