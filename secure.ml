open Effects.Infix

let write i =
  Effects.effect () `Write
let read () =
  Effects.effect () `Else >>= fun () ->
  Effects.effect 42 `Read

let () = Effects.run (
  (*
  Effects.map_p write [(); ()] |> (* rejected *)
  *)
  Effects.map_p read [(); ()] |>
  Effects.only (function `Read -> () | `Else -> ()) >>= fun _ ->
  Effects.return_unit
)
