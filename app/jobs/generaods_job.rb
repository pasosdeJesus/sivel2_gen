class GeneraodsJob < ApplicationJob
  queue_as :default

  def perform(idplantilla, fd, narch)
    puts "Inicio de generación de plantilla #{idplantilla} en #{narch}"
    pl = Heb412Gen::Plantillahcm.find(idplantilla)
    n = Heb412Gen::PlantillahcmController.
      llena_plantilla_multiple_fd(pl, fd)
    FileUtils.rm(narch + '.ods-generando')
    FileUtils.mv(n, narch + '.ods')
    puts "Fin de generación de plantilla #{idplantilla} en #{narch}"
  end
end
