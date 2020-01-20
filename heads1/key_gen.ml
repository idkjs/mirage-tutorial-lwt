(* Generated by ./config.exe configure -t unix (2020-01-20 15:36:38-00:00). *)

let logs =Functoria_runtime.Key.create
  (Functoria_runtime.Arg.opt (Cmdliner.Arg.list Mirage_runtime.Arg.log_threshold) [] (Cmdliner.Arg.info
   ~docs:"UNIKERNEL PARAMETERS" ?docv:(Some "LEVEL")
   ?doc:(Some
           "Be more or less verbose. $(docv) must be of the form\n$(b,*:info,foo:debug) means that that the log threshold is set to\n$(b,info) for every log sources but the $(b,foo) which is set to\n$(b,debug).  ")
   ?env:(Some (Cmdliner.Arg.env_var "MIRAGE_LOGS")) ["l"; "logs"]))
let logs_t = Functoria_runtime.Key.term logs
let logs () = Functoria_runtime.Key.get logs

let no_depext () = false

let target () = `Unix

let target_debug () = false

let warn_error () = false

let runtime_keys = List.combine [logs_t] ["logs"]

