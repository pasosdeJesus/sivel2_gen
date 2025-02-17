# frozen_string_literal: true

xml.instruct!
rdtd = if ENV["RAILS_ENV"] == "test"
  "test/dummy/public/relatos-099.dtd"
else
  "http://sincodh.pasosdejesus.org/relatos/relatos-099.dtd"
end

xml.declare!(:DOCTYPE, :relatos, :SYSTEM, rdtd)
xml.relatos do
  xml << render(
    partial: "sivel2_gen/casos/caso",
    format: [:xrlat],
    locals: { caso: caso },
  ).gsub(/^/, "     ")
end
