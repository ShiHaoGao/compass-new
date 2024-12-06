module attributes {calyx.entrypoint = "main"} {
  calyx.component @identity(%in: i32, %go: i1 {go}, %clk: i1 {clk}, %reset: i1 {reset}) -> (%out: i32, %done: i1 {done}) {
    %r.in, %r.write_en, %r.clk, %r.reset, %r.out, %r.done = calyx.register @r : i32, i1, i1, i1, i32, i1
    calyx.wires {
      calyx.assign %out = %r.out : i32
    }
    calyx.control {
      calyx.seq {
        calyx.invoke @r[](%r.in = %in) -> (i32)
      }
    }
  }
  calyx.component @main(%go: i1 {go}, %clk: i1 {clk}, %reset: i1 {reset}) -> (%done: i1 {done}, %out: i32) {
    %id.in, %id.go, %id.clk, %id.reset, %id.out, %id.done = calyx.instance @id of @identity : i32, i1, i1, i1, i32, i1
    %counter.in, %counter.write_en, %counter.clk, %counter.reset, %counter.out, %counter.done = calyx.register @counter : i32, i1, i1, i1, i32, i1
    %add.left, %add.right, %add.out = calyx.std_add @add : i32, i32, i32
    %lt.left, %lt.right, %lt.out = calyx.std_lt @lt : i32, i32, i1
    %r.in, %r.write_en, %r.clk, %r.reset, %r.out, %r.done = calyx.register @r : i32, i1, i1, i1, i32, i1
    %c0_i32 = hw.constant 0 : i32
    %c1_i32 = hw.constant 1 : i32
    %c8_i32 = hw.constant 8 : i32
    %c10_i32 = hw.constant 10 : i32
    %true = hw.constant true
    calyx.wires {
      calyx.group @init {
        calyx.assign %counter.in = %c0_i32 : i32
        calyx.assign %counter.write_en = %true : i1
        calyx.group_done %counter.done : i1
      }
      calyx.group @incr {
        calyx.assign %add.left = %counter.out : i32
        calyx.assign %add.right = %c1_i32 : i32
        calyx.assign %counter.in = %add.out : i32
        calyx.assign %counter.write_en = %true : i1
        calyx.group_done %counter.done : i1
      }
      calyx.assign %lt.left = %counter.out : i32
      calyx.assign %lt.right = %c8_i32 : i32
    }
    calyx.control {
      calyx.seq {
        calyx.enable @init
        calyx.while %lt.out {
          calyx.seq {
            calyx.invoke @id[](%id.in = %c10_i32) -> (i32)
            calyx.invoke @r[](%r.in = %id.out) -> (i32)
            calyx.enable @incr
          }
        }
      }
    }
  }
}

