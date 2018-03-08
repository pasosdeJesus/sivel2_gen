class GeneraodsJob < ApplicationJob
  queue_as :default

  def perform(idplantilla, fd, narch)
    puts "Inicio de generación de plantilla #{idplantilla} en #{narch}"
    pl = Heb412Gen::Plantillahcm.find(idplantilla)
    ultp = 0
    n = Heb412Gen::PlantillahcmController.
      llena_plantilla_multiple_fd(pl, fd) do |t, i|
      p = 0
      if t>0
        p = 100*i/t
      end
      if p != ultp
        FileUtils.mv(narch + ".ods-#{ultp}", narch + ".ods-#{p}")
        ultp = p
      end
    end
    FileUtils.rm(narch + ".ods-#{ultp}")
    FileUtils.mv(n, narch + '.ods')
    puts "Fin de generación de plantilla #{idplantilla} en #{narch}"
  end
end
