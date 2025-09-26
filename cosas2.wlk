object knightRider {
  method peso() = 500
  method peligrosidad() = 10
  method esPesoPar() = self.peso().even()
  method bulto() = 1
  method consecuenciaDeLaCarga() {}
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
  method bulto() = 2
  method consecuenciaDeLaCarga() {
    self.transformarseEnRobot()
  }
}

object ladrillos {
  var cantidad = 10
  method cantidaa(nuevaCantidad) {
    cantidad = 0.max(nuevaCantidad)
  } 

  method peso() {
    return 2 * cantidad
  }

  method peligrosidad() = 2
  method esPesoPar() = self.peso().even()
  method bulto() {
    return if (cantidad <= 100) {1} 
    else if (cantidad.between(101, 300)) {2} 
    else {3}
  }
  method consecuenciaDeLaCarga() {
    cantidad += 12
  }
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
  method bulto() = 1
  method consecuenciaDeLaCarga() {
    peso = (peso - 10).max(0)
  }
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
  method bulto() = if (estaConMisiles) 2 else 1
  method consecuenciaDeLaCarga() {self.cargarMisiles()}
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

  method bulto() = 1 + cosasDentro.sum({c => c.bulto()})
  method consecuenciaDeLaCarga() {
    if (!cosasDentro.isEmpty()) {
      cosasDentro.forEach({c => c.consecuenciaDeLaCarga()})
    }
  }
}

object residuosRadiactivos {
  var property peso = 0
  method peligrosidad() = 200
  method esPesoPar() = self.peso().even()
  method bulto() = 1
  method consecuenciaDeLaCarga() {self.peso(self.peso() + 15)}
}

object embalajeDeSeguridad {
  var cosaEmbalada = residuosRadiactivos

  method embalar(unaCosa) {
    cosaEmbalada = unaCosa
  }

  method peso() = cosaEmbalada.peso()
  method peligrosidad() = cosaEmbalada.peligrosidad() / 2
  method esPesoPar() = self.peso().even() 
  method bulto() = 2
  method consecuenciaDeLaCarga() {}
}