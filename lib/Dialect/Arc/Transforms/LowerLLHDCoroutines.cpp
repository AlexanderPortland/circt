//===----------------------------------------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//

#include "circt/Dialect/Arc/ArcOps.h"
#include "circt/Dialect/Arc/ArcPasses.h"
#include "circt/Dialect/Comb/CombOps.h"
#include "circt/Dialect/HW/HWOps.h"
#include "circt/Dialect/LLHD/LLHDOps.h"
#include "mlir/Analysis/Liveness.h"
#include "mlir/IR/Dominance.h"
#include "mlir/IR/SymbolTable.h"
#include "mlir/Interfaces/ControlFlowInterfaces.h"
#include "mlir/Pass/Pass.h"
#include "llvm/ADT/DenseMap.h"
#include "llvm/ADT/SetVector.h"
#include "llvm/Support/GenericIteratedDominanceFrontier.h"

namespace circt {
namespace arc {
#define GEN_PASS_DEF_LOWERLLHDCOROUTINESPASS
#include "circt/Dialect/Arc/ArcPasses.h.inc"
} // namespace arc
} // namespace circt

using namespace circt;
using namespace arc;
using namespace mlir;

namespace {
struct LowerLLHDCoroutinesPass
    : public arc::impl::LowerLLHDCoroutinesPassBase<LowerLLHDCoroutinesPass> {
  void runOnOperation() override;
};
} // namespace

void LowerLLHDCoroutinesPass::runOnOperation() {
  // TODO(alex)
}