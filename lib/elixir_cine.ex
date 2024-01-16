# Enumerar las películas y pedir al usuario que ingrese el número correspondiente a la película que desea ver.
peliculas = Cine.mostrar_peliculas() |> Enum.with_index()
Enum.each(peliculas, fn {pelicula, index} -> IO.puts("#{index + 1}. #{pelicula.nombre}") end)

pelicula_id =
  IO.gets("Seleccione la pelicula que desea ver: ") |> String.trim() |> String.to_integer()
if pelicula_id < 1 or pelicula_id > length(peliculas) do
  IO.puts("Entrada no válida. Por favor, ingrese un número entre 1 y #{length(peliculas)}.")
  System.halt(1)
end

# Mostrar los horarios de la película seleccionada y pedir al usuario que ingrese el número correspondiente al horario que desea.
horarios = Cine.mostrar_horarios(pelicula_id) |> Enum.with_index()
Enum.each(horarios, fn {horario, index} -> IO.puts("#{index + 1}. #{horario}") end)

horario_id =
  IO.gets("Seleccione el horario que desea ver: ") |> String.trim() |> String.to_integer()
if horario_id < 1 or horario_id > length(horarios) do
  IO.puts("Entrada no válida. Por favor, ingrese un número entre 1 y #{length(horarios)}.")
  System.halt(1)
end

cantidad_entradas =
  IO.gets("Ingrese la cantidad de entradas: ") |> String.trim() |> String.to_integer()
if cantidad_entradas < 1 do
  IO.puts("Entrada no válida. Por favor, ingrese un número mayor que 0.")
  System.halt(1)
end

nombre_cliente = IO.gets("Ingrese el nombre del cliente: ") |> String.trim()
if nombre_cliente == "" do
  IO.puts("Entrada no válida. Por favor, ingrese un nombre.")
  System.halt(1)
end

# Generar y mostrar la factura con un formato similar a una factura, incluso con un borde simple.
factura = Cine.generar_factura(pelicula_id, horario_id, cantidad_entradas, nombre_cliente)
IO.puts("====================================")
IO.puts("Factura")
IO.puts("====================================")
IO.puts("Cliente: #{factura.nombre_cliente}")
IO.puts("Pelicula: #{factura.pelicula}")
IO.puts("Horario: #{factura.horario}")
IO.puts("Cantidad de entradas: #{factura.cantidad_entradas}")
IO.puts("Subtotal: $#{factura.subtotal}")
IO.puts("IVA: $#{factura.iva}")
IO.puts("Total: $#{factura.total}")
IO.puts("====================================")
