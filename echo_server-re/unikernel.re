open Lwt.Infix;

module Echo_server =
       (C: Mirage_console.S, Time: Mirage_time.S, R: Mirage_random.S) => {
  let read_line = () =>
    Time.sleep_ns(Duration.of_ms(Randomconv.int(~bound=2500, R.generate)))
    >|= (() => String.make(Randomconv.int(~bound=20, R.generate), 'a'));

  let start = (c, _time, _r) => {
    let rec echo_server =
      fun
      | 0 => Lwt.return()
      | n =>
        read_line() >>= (s => C.log(c, s) >>= (() => echo_server(n - 1)));

    echo_server(10);
  };
};
