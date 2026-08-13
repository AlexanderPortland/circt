// RUN: arcilator %s --no-runtime --emit-mlir 
// --debug-only=dialect-conversion --mlir-print-stacktrace-on-diagnostic
hw.module @m(in %clk : i1, in %enable : i1) {
  llhd.process {
    cf.br ^bb1
  ^bb1:
    llhd.call_coroutine @empty_statement() : () -> ()
    cf.br ^bb1
  }
  hw.output
}

llhd.coroutine private @empty_statement() {
  llhd.return
}
