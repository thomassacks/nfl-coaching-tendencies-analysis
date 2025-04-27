# 🏈 NFL Team Early-Down Pass Rate Analysis (2024 Season)

---

## 📋 Overview

This project analyzes early-down (1st and 2nd down) passing tendencies of NFL teams during the 2024 regular season.

Using play-by-play data from `nflfastR`, I calculated:
- Each team's overall early-down pass rate
- Each team's pass rate when Leading, Tied, and Trailing

This provides insights into offensive philosophy, game-state adjustments, and coaching tendencies.

---

## 📂 Data Source

- **Dataset:** NFL play-by-play data (`nflfastR` package)
- **Season:** 2024
- **Plays Analyzed:** Only 1st and 2nd down run and pass plays (special teams and penalties excluded)

---

## ⚙️ Methodology

- Pulled 2024 NFL play-by-play data using `nflfastR`.
- Filtered for 1st and 2nd down plays where `play_type` was `"run"` or `"pass"`.
- Grouped plays by offensive team (`posteam`).
- Calculated:
  - Total early-down plays
  - Total early-down passes
  - **Pass Rate** = (Pass Plays ÷ Total Plays)
- Split early-down plays by game state:
  - Leading
  - Tied
  - Trailing
- Merged official NFL team colors for visualizations.

---

## 📈 Key Summary Statistics

- **Average Team Early-Down Pass Rate:** 52.4%
- **Most Pass-Heavy Team:** Cleveland Browns — 61.7%
- **Most Run-Heavy Team:** Philadelphia Eagles — 40.8%

✅ These numbers show that while passing remains slightly favored league-wide on early downs, major differences exist:
- **Cleveland** was notably aggressive.
- **Philadelphia** skewed heavily toward the run.

---

## 🏆 Top 5 Most Pass-Heavy Teams (Early Downs)

1. Cleveland Browns — 61.7%
2. Las Vegas Raiders — 61.1%
3. Cincinnati Bengals — 61.0%
4. Seattle Seahawks — 59.6%
5. New York Jets — 58.5%

---

## 🚩 Bottom 5 Most Pass-Heavy Teams (Early Downs)

1. Philadelphia Eagles — 40.8%
2. Baltimore Ravens — 42.4%
3. Green Bay Packers — 44.0%
4. Pittsburgh Steelers — 46.3%
5. Buffalo Bills — 47.0%

---

## 📸 Visualizations

### 1. Early-Down Pass Rate by Team (2024)

![Team Pass Rate](http://github.com/thomassacks/nfl-coaching-tendencies-analysis/blob/main/nfl-coaching-tendencies-chart.png)

**Key Takeaways:**
- **CLE, LV, CIN** led the NFL in early-down pass rates, consistently passing more than 60% of the time.
- **PHI, BAL, GB** were among the most run-heavy teams on early downs.
- Significant team-level differences suggest strong coaching philosophy impacts.

---

### 2. Early-Down Pass Rate by Game State (Leading, Tied, Trailing)

![Pass Rate by Game State](https://github.com/thomassacks/nfl-coaching-tendencies-analysis/blob/main/nfl-eay-down-pass-rate-by-game-state-graph.png)

**Key Takeaways:**
- **Trailing teams** (blue bars) consistently passed at the highest rates across all teams.
- Even when **tied**, teams like **BUF** and **DET** maintained aggressive pass tendencies.
- Some teams like **GB** and **PHI** remained run-focused even when trailing, highlighting system consistency.

---

## 🚀 Future Improvements

- Add breakdowns by:
  - Field position (own territory vs midfield vs red zone)
  - Game quarter (early vs late game)
- Compare trends across multiple seasons (2022–2024).
- Build an interactive dashboard (Tableau or Shiny App).

---

## 📬 Contact

Feel free to reach out to connect or collaborate:
- 📧 Email: thomasbsacks@gmail.com
- 💼 LinkedIn: [Thomas Sacks](https://www.linkedin.com/in/thomas-sacks/)
