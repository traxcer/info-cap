json.array!(@cursos) do |curso|
  json.extract! curso, :id, :tipo, :comienzo, :final, :turno, :lugar, :cierre
  json.url curso_url(curso, format: :json)
end
