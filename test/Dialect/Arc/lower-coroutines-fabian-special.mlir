// RUN: arcilator %s --no-runtime --emit-mlir 

hw.module @Foo() {
  llhd.process {
    llhd.call_coroutine @baz() : () -> ()
    llhd.halt
  }
  hw.output
}
llhd.coroutine private @bar() {
  %0 = sim.fmt.literal "\0A"
  %c1000000_i64 = hw.constant 1000000 : i64
  %1 = llhd.constant_time <42fs, 0d, 0e>
  %2 = llhd.current_time
  llhd.wait delay %1, ^bb1
^bb1:  // pred: ^bb0
  %3 = llhd.time_to_int %2
  %4 = comb.divu %3, %c1000000_i64 : i64
  %5 = sim.fmt.dec %4 : i64
  %6 = sim.fmt.concat (%5, %0)
  sim.proc.print %6
  llhd.return
}
llhd.coroutine private @baz() {
  %0 = sim.fmt.literal "world\0A"
  %1 = sim.fmt.literal "hello\0A"
  sim.proc.print %1
  llhd.call_coroutine @bar() : () -> ()
  sim.proc.print %0
  llhd.return
}