type ('v, 'e) t = 'v Lwt.t

let return_unit = Lwt.return_unit
let return = Lwt.return
let effect v _ = Lwt.return v
let only _ v = v
let run = Lwt_main.run

module Infix = Lwt.Infix

let map_p = Lwt_list.map_p
let map_s = Lwt_list.map_s
let iter_p = Lwt_list.iter_p
let iter_s = Lwt_list.iter_s
