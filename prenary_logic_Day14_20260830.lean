import Mathlib

/- ================================================================
   偏元数学 · 逻辑与计算 Day14（香农熵加 ε · 信息下界偏移）
   核心：偏元熵 H_ε = H + ε，下界从 0 偏移到 ε——信息不能无损压缩到绝对下界。
   这是"ε 平移特殊值"铁律在信息论侧的落地（承 Day11 稳定点/Day12 开球/Day13 单位元）。
   注：图灵机每步留差（离散vs连续、类型坑）、停机问题 ε-可判定（宏大叙事）、
       哥德尔不完备 ε 化（开放问题+隐喻），进迷雾储物箱待确认。
   ================================================================ -/

noncomputable section

-- 偏元熵：H_ε = H + ε
noncomputable def prenary_entropy (H ε : ℝ) : ℝ :=
  H + ε

-- 退化：ε=0 → 经典熵
theorem prenary_entropy_degenerate (H : ℝ) :
    prenary_entropy H 0 = H := by
  unfold prenary_entropy
  rw [add_zero]

-- 非平凡：ε≠0 → 偏元熵 ≠ 经典熵
theorem prenary_entropy_non_trivial (H : ℝ) {ε : ℝ} (hε : ε ≠ 0) :
    prenary_entropy H ε ≠ H := by
  intro h
  unfold prenary_entropy at h
  have hε0 : ε = 0 := by linarith
  exact hε hε0

-- 信息下界偏移（核心）：偏元熵的下界从 0 抬到 ε（信息不能无损压缩到绝对下界）
theorem prenary_entropy_lower_bound_shifted (H ε : ℝ) (hH : 0 ≤ H) :
    ε ≤ prenary_entropy H ε := by
  unfold prenary_entropy
  linarith

end
