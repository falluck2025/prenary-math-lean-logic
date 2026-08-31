import Mathlib

/- ================================================================
   偏元数学 · 逻辑与计算 Day14-02（编码下界偏移 + 概率归一化）
   核心：无损压缩下界从 H 抬到 H+ε（编码动作留差）；
         偏元概率归一化 P(Ω)=1+η（承 Day9 测度）。
   这是"ε 平移特殊值"铁律的两个新实例（下界 0→ε、归一化 1→1+η）。
   ================================================================ -/

noncomputable section

-- 偏元熵（承 Day14）：H_ε = H + ε
noncomputable def prenary_entropy (H ε : ℝ) : ℝ :=
  H + ε

-- 编码下界偏移（核心）：无损压缩下界从 H 抬到 H+ε（编码动作留差）
theorem prenary_code_lower_bound (H ε : ℝ) (hε : 0 ≤ ε) :
    H ≤ prenary_entropy H ε := by
  unfold prenary_entropy
  linarith

-- 偏元概率归一化：P_η(Ω) = 1 + η（承 Day9 测度）
noncomputable def prenary_total_prob (η : ℝ) : ℝ :=
  1 + η

-- 退化：η=0 → P(Ω) = 1（经典归一化）
theorem prenary_total_prob_degenerate :
    prenary_total_prob 0 = 1 := by
  unfold prenary_total_prob
  rw [add_zero]

-- 非平凡：η≠0 → P(Ω) ≠ 1（偏元概率不归一）
theorem prenary_total_prob_non_trivial {η : ℝ} (hη : η ≠ 0) :
    prenary_total_prob η ≠ 1 := by
  unfold prenary_total_prob
  intro h
  have hη0 : η = 0 := by linarith
  exact hη hη0

end
