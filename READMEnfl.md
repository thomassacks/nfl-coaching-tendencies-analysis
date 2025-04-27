NFL Team Early-Down Pass Rate Analysis (2024 Season)

OVERVIEW:

This project analyzes early-down (1st and 2nd down) passing tendencies of NFL teams during the 2024 regular season.

Using play-by-play data from nflfastR, I calculated:

- Each team's overall early-down pass rate

- Each team's pass rate when Leading, Tied, and Trailing

This provides insights into offensive philosophy, game-state adjustments, and coaching tendencies.



DATA SOURCE:

Dataset: NFL play-by-play data (nflfastR package)

Season: 2024

Plays Analyzed: Only 1st and 2nd down run and pass plays (special teams, penalties excluded)



METHODOLOGY:

Pulled 2024 NFL play-by-play data using nflfastR.

Filtered for 1st and 2nd down plays (down %in% c(1, 2)) where play_type was "run" or "pass."

Grouped plays by offensive team (posteam).

Calculated:

- Total early-down plays

- Total early-down passes

- Pass rate = (Pass Plays ÷ Total Plays)

Split early-down plays by game state:

- Leading

- Tied

- Trailing

Merged official NFL team colors for clean visualizations.


KEY SUMMARY STATISTICS:

- Average Team Early Down Pass Rate = 52.4%

- Most Early Down Pass Heavy Team = Cleveland (61.7%)

- Most Early Down Run Heavy Team = Philadelphia (40.8%)

These numbers show that while passing remains slightly favored league-wide on early downs, there are major differences across teams, with the Browns notably aggressive and the Eagles skewing heavily toward the run.

Top 5 Most Pass-Heavy Teams on Early Downs:

1. Cleveland Browns - 61.7%

2. Las Vegas Raiders - 61.1%

3. Cincinnati Bengals - 61.0%

4. Seattle Seahawks - 59.6%

5. New York Jets - 58.5%

Bottom 5 Most Pass-Heavy Teams on Early Downs:

1. Philadelphia Eagles - 40.8%

2. Baltimore Ravens - 42.4%

3. Green Bay Packers - 44.0%

4. Pittsburg Steelers - 46.3%

5. Buffalo Bills - 47.0%

(Visualizations attached)


Future Improvements:

Add breakdowns by:

- Field position (inside own territory, midfield, red zone)

- Quarter (early vs late game)

- Compare trends across multiple seasons (2022–2024).

- Build an interactive dashboard (Tableau or Shiny App).


Contact

Feel free to reach out to connect or collaborate:
Email | thomasbsacks@gmail.com
LinkedIn | https://www.linkedin.com/in/thomas-sacks/

