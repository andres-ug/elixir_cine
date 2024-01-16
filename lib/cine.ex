import PeliculaCine

defmodule Cine do
  def peliculas do
    [
      %PeliculaCine{
        nombre: "Spiderman: Far From Home",
        horarios: ["10:00", "12:00", "14:00", "16:00", "18:00"]
      },
      %PeliculaCine{
        nombre: "Rapidos y Furiosos 5",
        horarios: ["11:00", "13:00", "15:00", "17:00", "19:00"]
      },
      %PeliculaCine{
        nombre: "Mi abuela es un peligro",
        horarios: ["12:00", "14:00", "16:00", "18:00", "20:00"]
      },
      %PeliculaCine{
        nombre: "La princesa y el sapo",
        horarios: ["10:00", "13:00", "16:00", "19:00", "22:00"]
      },
      %PeliculaCine{
        nombre: "Mi amigo es un mounstro",
        horarios: ["11:00", "14:00", "17:00", "20:00", "23:00"]
      }
    ]
  end

  def mostrar_peliculas do
    peliculas()
  end

  def mostrar_horarios(pelicula_id) do
    peliculas() |> Enum.at(pelicula_id - 1) |> Map.get(:horarios)
  end

  def generar_factura(pelicula_id, horario_id, cantidad_entradas, nombre_cliente) do
    pelicula = peliculas() |> Enum.at(pelicula_id - 1)
    horario = pelicula.horarios |> Enum.at(horario_id - 1)
    # asumimos que cada entrada cuesta 3.50
    subtotal = cantidad_entradas * 3.50
    iva = subtotal * 0.12
    total = subtotal + iva

    %{
      nombre_cliente: nombre_cliente,
      pelicula: pelicula.nombre,
      horario: horario,
      cantidad_entradas: cantidad_entradas,
      subtotal: subtotal,
      iva: iva,
      total: total
    }
  end
end
