// RUN: arcilator %s --no-runtime --emit-mlir 
// --mlir-print-stacktrace-on-diagnostic --verbose-pass-executions --mlir-print-ir-before-all
hw.module @m(in %clk : i1, in %enable : i1) {
  llhd.process {
    cf.br ^bb1
  ^bb1:
    llhd.call_coroutine @non_empty_statement() : () -> ()
    cf.br ^bb1
  }
  hw.output
}

llhd.coroutine private @non_empty_statement() {
  func.call @can_do_anything() : () -> ()
  llhd.return
}

func.func private @can_do_anything()
