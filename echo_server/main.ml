(* Generated by ./config.exe configure -t unix (2020-01-20 15:21:18-00:00). *)

open Lwt.Infix
let return = Lwt.return
let run t = OS.Main.run t ; exit
0

let _ = Printexc.record_backtrace true

module Unikernel1 = Unikernel.Echo_server(Console_unix)(OS.Time)
  (Mirage_random_stdlib)

module Mirage_logs1 = Mirage_logs.Make(Pclock)

let argv_unix1 = lazy (
  Bootvar.argv ()
  )

let console_unix_01 = lazy (
  Console_unix.connect "0"
  )

let time1 = lazy (
  return ()
  )

let random1 = lazy (
  Mirage_random_stdlib.initialize ()
  )

let pclock1 = lazy (
  return ()
  )

let key1 = lazy (
  let __argv_unix1 = Lazy.force argv_unix1 in
  __argv_unix1 >>= fun _argv_unix1 ->
  return (Functoria_runtime.with_argv (List.map fst Key_gen.runtime_keys) "echo_server" _argv_unix1)
  )

let f11 = lazy (
  let __console_unix_01 = Lazy.force console_unix_01 in
  let __time1 = Lazy.force time1 in
  let __random1 = Lazy.force random1 in
  __console_unix_01 >>= fun _console_unix_01 ->
  __time1 >>= fun _time1 ->
  __random1 >>= fun _random1 ->
  Unikernel1.start _console_unix_01 _time1 _random1
  )

let mirage_logs1 = lazy (
  let __pclock1 = Lazy.force pclock1 in
  __pclock1 >>= fun _pclock1 ->
  let ring_size = None in
  let reporter = Mirage_logs1.create ?ring_size () in
  Mirage_runtime.set_level ~default:Logs.Info (Key_gen.logs ());
  Mirage_logs1.set_reporter reporter;
  Lwt.return reporter
  )

let mirage1 = lazy (
  let __key1 = Lazy.force key1 in
  let __mirage_logs1 = Lazy.force mirage_logs1 in
  let __f11 = Lazy.force f11 in
  __key1 >>= fun _key1 ->
  __mirage_logs1 >>= fun _mirage_logs1 ->
  __f11 >>= fun _f11 ->
  Lwt.return_unit
  )

let () =
  let t =
  Lazy.force key1 >>= fun _ ->
    Lazy.force mirage_logs1 >>= fun _ ->
    Lazy.force mirage1
  in run t

