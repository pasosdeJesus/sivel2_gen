const {sivel2_gen_procesa_eliminaracto} = require('../../app/assets/javascripts/sivel2_gen/motor')
const {sivel2_gen_procesa_eliminaractocolectivo} = require('../../app/assets/javascripts/sivel2_gen/motor')
const {sivel2_gen_prepara_eventos_unicos} = require('../../app/assets/javascripts/sivel2_gen/motor')

describe('verificando variables globales', () => {
  test('procesa acto dctocolectivo eberia estar en false', () => {
      expect(sivel2_gen_procesa_eliminaracto).not.toBeTruthy()
      expect(sivel2_gen_procesa_eliminaractocolectivo).not.toBeTruthy()
    })
})

describe('pruebas de funciones de sivel2_gen_prepara eventos comunes', () => {

})
