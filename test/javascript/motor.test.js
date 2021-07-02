const {coloresco} = require('../../app/assets/javascripts/sivel2_gen/motor')
const {nombresco} = require('../../app/assets/javascripts/sivel2_gen/motor')

describe('verificando los nombres de motor', () => {
  test('los colores contienen blanco', () => {
    expect(coloresco).toContain('blanco')
  })
  test('los nombres contienen Alejandro', () => {
    expect(nombresco()).toContain('Alejandro')
  })
})
